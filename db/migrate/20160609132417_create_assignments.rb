class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :doc_link
      t.date :complete_status
      t.date :date_due
      t.date :date_start
      t.string :description
      t.string :name
      t.integer :project_id

      t.timestamps

    end
  end
end
