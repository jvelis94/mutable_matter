class AddForeignKeysToReply < ActiveRecord::Migration[5.2]
  def change
    add_reference :replies, :comments, foreign_key: true
  end
end
