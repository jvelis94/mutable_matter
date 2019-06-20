class AddConfrimableToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :date
    add_column :users, :confirmation_sent_at, :date
    add_column :users, :unconfirmed_email, :string
  end
end
