class Ad < ActiveRecord::Base
	
	belongs_to :user
  has_attached_file :preview, :default_url => "missing.jpg", :styles => { :medium => "125x125^", :featured => "250x250^", :showpg => "400x400^" }, :convert_options => {:medium => "-gravity center -extent 125x125", :featured => "-gravity center -extent 250x250", :showpg => "-gravity center -extent 400x400"}

  validates :title, length: { maximum: 35 }
  validates :url, length: { maximum: 40 }

  def self.search(search)
  if search
    find(:all, :conditions => ['LOWER(title) ILIKE ?', ("%#{search.downcase}%")])
  else
    find(:all)
  end
end
end
