class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :user_id
      t.date :date_start
      t.string :name

      t.timestamps

    end
  end
end
