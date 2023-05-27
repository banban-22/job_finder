class DropApplicationStatuses < ActiveRecord::Migration[7.0]
  def change
    drop_table :application_statuses
  end
end
