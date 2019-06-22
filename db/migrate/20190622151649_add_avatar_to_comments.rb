class AddAvatarToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :avatar, :string
  end
end
