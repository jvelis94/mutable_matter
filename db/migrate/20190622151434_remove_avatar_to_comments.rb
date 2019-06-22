class RemoveAvatarToComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :avatar
  end
end
