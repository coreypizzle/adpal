class AddPreviewColumnsToAd < ActiveRecord::Migration
    def self.up
    add_attachment :ads, :preview
  end

  def self.down
    remove_attachment :ads, :preview
  end
end
