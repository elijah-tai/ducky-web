class AddAttachmentImageToRequests < ActiveRecord::Migration
  def self.up
    change_table :requests do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :requests, :image
  end
end
