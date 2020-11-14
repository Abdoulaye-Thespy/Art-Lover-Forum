class AddAvatarColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_attachment :users, :image
    add_attachment :users, :coverimage
  end
end
