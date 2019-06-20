class RemoveCommentsIdFromReply < ActiveRecord::Migration[5.2]
  def change
    remove_reference :replies, :comments, foreign_key: true
  end
end
