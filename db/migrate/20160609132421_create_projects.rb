class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :description
      t.string :name
      t.integer :period_id

      t.timestamps

    end
  end
end
