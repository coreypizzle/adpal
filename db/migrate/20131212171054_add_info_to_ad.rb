class AddInfoToAd < ActiveRecord::Migration
  def change
    add_column :ads, :info, :text
  end
end
