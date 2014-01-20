class ChargesController < ApplicationController

def new

end

def create
  # Amount in cents
  @amount = 75

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :interval    => "weekly"
    :amount      => @amount,
    :description => 'Ad Customer',
    :currency    => 'gbp'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end

end
