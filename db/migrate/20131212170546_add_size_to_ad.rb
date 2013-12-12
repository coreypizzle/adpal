class AddSizeToAd < ActiveRecord::Migration
  def change
    add_column :ads, :size, :string
  end
end
