class AddStripeToAds < ActiveRecord::Migration
  def change
    add_column :ads, :stripe_customer_token, :string
  end
end
