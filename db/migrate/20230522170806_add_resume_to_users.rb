class AddResumeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :resume, :oid
  end
end
