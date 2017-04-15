require 'spec_helper'

describe CancelSubscriptionWorker do

  before do
    @cancel_subscription_worker = CancelSubscriptionWorker.new
  end

  it "when the Stripe API returns a customer" do
    @customer = double("customer")
    StripeCustomer.should_receive(:retrieve).with("12345").and_return(@customer)
    @customer.should_receive(:cancel_subscription_if_various_conditions_apply)
    @cancel_subscription_worker.perform("12345")
  end

  it "unless the Stripe API returned no customer" do
    StripeCustomer.should_receive(:retrieve).with("12345").and_return(nil)
    expect{@cancel_subscription_worker.perform("12345")}.to_not raise_error
  end

end

