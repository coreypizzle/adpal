class RemoveSizeFromAd < ActiveRecord::Migration
  def change
    remove_column :ads, :size, :integer
  end
end
