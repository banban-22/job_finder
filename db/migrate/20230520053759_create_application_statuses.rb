class CreateApplicationStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :application_statuses do |t|
      t.references :application, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
