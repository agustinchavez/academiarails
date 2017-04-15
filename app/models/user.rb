class User < ActiveRecord::Base

  rolify # https://github.com/EppO/rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation,
    :remember_me, :stripe_token, :coupon, :last_4_digits, :customer_id
  attr_accessor :stripe_token, :coupon

  before_save :update_stripe
  before_destroy :cancel_subscription

  def update_plan(role)
    self.role_ids = []
    self.add_role(role.name)
    UpdateSubscriptionWorker.perform_async(:customer_id => customer_id,
      :role_name => role.name) unless customer_id.nil?
  end

  def autistic_mode?
    email.include?(ENV['ADMIN_EMAIL']) || (email.include?('@example.com') && !Rails.env.production?)
  end

  def update_stripe
    return if autistic_mode?
    if customer_id
      UpdateCustomerWorker.perform_async(id, stripe_token)
    else
      raise "Stripe token not present. Can't create account." unless stripe_token.present?
      CreateCustomerWorker.perform_async(id, stripe_token, coupon)
    end
  end

  def cancel_subscription
    CancelSubscriptionWorker.perform_async(customer_id) unless customer_id.nil?
  end

  def expire
    Email.to self.email, :expiration
    destroy
  end

  def update_with_stripe_data(api_response)
    update_attributes(last_4_digits: api_response.cards.data.first["last4"],
      customer_id: api_response.id, stripe_token: nil)
  end

end

