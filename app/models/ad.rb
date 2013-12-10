class Ad < ActiveRecord::Base
	
	attr_accessible :title, :url, :preview
	belongs_to :user
  has_attached_file :preview, :default_url => "missing.jpg"

  validates :title, length: { maximum: 20 }
  validates :url, length: { maximum: 20 }
end
