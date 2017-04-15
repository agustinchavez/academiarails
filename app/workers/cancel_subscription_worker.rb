class CancelSubscriptionWorker
  include Sidekiq::Worker
  def perform(customer_id)
    customer = StripeCustomer.retrieve(customer_id)
    customer.cancel_subscription_if_various_conditions_apply unless customer.nil?
  end
end

