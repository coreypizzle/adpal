class Ad < ActiveRecord::Base
	
	belongs_to :user
  has_attached_file :preview, :styles => { :medium => "125x125^", :featured => "250x250^", :showpg => "400x400^" }, :convert_options => {:medium => "-gravity center -extent 125x125", :featured => "-gravity center -extent 250x250", :showpg => "-gravity center -extent 400x400"}

  validates :title, presence: true, length: { maximum: 35 }
  validates :url, presence: true, length: { maximum: 40 }
  validates :info, presence: true
  validates :location, presence: true

  attr_accessor :stripe_card_token

  def self.search(search)
  if search
    find(:all, :conditions => ['LOWER(title) ILIKE ? or LOWER(info) ILIKE ? or LOWER(location) ILIKE ?', ("%#{search.downcase}%"), ("%#{search.downcase}%"), ("%#{search.downcase}%")])
  else
    find(:all)
  end
  end

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: "title", plan: "ad_f", card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end

  def destroy_payment
      cu = Stripe::Customer.retrieve(stripe_customer_token)
      cu.cancel_subscription
      cu.delete
      destroy!
  end
end
