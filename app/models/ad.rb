class Ad < ActiveRecord::Base
	
	attr_accessible :title, :url, :preview
	belongs_to :user
  has_attached_file :preview, :default_url => "missing.jpg", :styles => { :medium => "500x175>", :thumb => "100x100>" }, :convert_options => {:thumb => "-gravity center -extent 100x100"}

  validates :title, length: { maximum: 20 }
  validates :url, length: { maximum: 20 }
end
