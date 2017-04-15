class UpdateCustomerWorker
  include Sidekiq::Worker
  attr_accessor :user, :customer

  def perform(user_id, stripe_token)
    @user = User.find(user_id)
    @customer = StripeCustomer.retrieve(@user.customer_id)
    update_customer(stripe_token)
    update_user
  end

  def update_customer(stripe_token)
    @customer.update_from_database(@user, stripe_token)
  end

  def update_user
    @user.update_with_stripe_data(@customer)
  end
end

