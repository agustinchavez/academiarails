require 'spec_helper'

describe StripeCustomer do

  before do
    base = Stripe::Customer
    @stripe_customer = StripeCustomer.new(base)
  end

  it "only cancels subscriptions which exist" do
    @stripe_customer.stub(:has_a_subscription?) { false }
    expect(@stripe_customer).to_not receive(:cancel_subscription)
    @stripe_customer.cancel_existing_subscription
  end

  describe "#has_a_subscription?" do

    it "must be active" do
      @stripe_customer.stub(:subscription) { double("subscription", status: 'active') }
      expect(@stripe_customer.has_a_subscription?).to be_true
    end

    it "must not be deleted" do
      @stripe_customer.stub(:deleted) { true }
      expect(@stripe_customer.has_a_subscription?).to be_false
    end

  end

end

