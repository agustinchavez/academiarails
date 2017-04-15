require 'spec_helper'

describe UpdateSubscriptionWorker do

  before do
    @customer = double("customer")
    @update_subscription_worker = UpdateSubscriptionWorker.new
    @options = {customer_id: "12345", role_name: "Ultra Mega Platinum What What"}
  end

  it "updates a subscription" do
    StripeCustomer.should_receive(:retrieve).with("12345").and_return(@customer)
    @customer.should_receive(:update_subscription).with(plan: "Ultra Mega Platinum What What")
    @update_subscription_worker.perform(@options)
  end

end

