class RenamePinsToRequests < ActiveRecord::Migration
  def change
  	rename_table :pins, :requests
  end
end
