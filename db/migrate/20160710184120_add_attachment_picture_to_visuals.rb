class AddAttachmentPictureToVisuals < ActiveRecord::Migration
  def self.up
    change_table :visuals do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :visuals, :picture
  end
end
