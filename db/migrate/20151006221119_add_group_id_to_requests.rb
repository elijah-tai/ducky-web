class AddGroupIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :group_id, :integer
    add_index :requests, :group_id
  end
end
