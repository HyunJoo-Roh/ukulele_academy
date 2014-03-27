class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :day
      t.integer :hour

      t.timestamps
    end
  end
end
