class AddLocationToAd < ActiveRecord::Migration
  def change
    add_column :ads, :location, :text
  end
end
