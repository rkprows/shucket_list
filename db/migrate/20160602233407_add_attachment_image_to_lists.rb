class AddAttachmentImageToLists < ActiveRecord::Migration
  def self.up
    change_table :lists do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :lists, :image
  end
end
