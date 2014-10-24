class AddContactToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contact, :integer
    add_index :pins, :contact
  end
end
