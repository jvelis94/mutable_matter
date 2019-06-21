class AddColumnsToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
  end
end
