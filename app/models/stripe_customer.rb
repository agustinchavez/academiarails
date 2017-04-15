require 'delegate'

class StripeCustomer < DelegateClass(Stripe::Customer)

  def update_from_database(user, stripe_token)
    options = {email: user.email, description: user.name}
    options.merge(card: stripe_token) if stripe_token
    update_attributes(options)
  end

  def has_a_subscription?
    !(self.respond_to? 'deleted') && subscription.status == 'active'
  end

  def cancel_existing_subscription
    cancel_subscription if has_a_subscription?
  end
end

