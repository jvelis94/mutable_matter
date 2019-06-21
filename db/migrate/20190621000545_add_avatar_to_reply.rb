class AddAvatarToReply < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :avatar, :string
  end
end
