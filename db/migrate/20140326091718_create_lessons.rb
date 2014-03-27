class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.datetime :lesson_date
      t.integer :turn
      t.text :goal
      t.string :song
      t.string :homework
      t.references :user, index: true

      t.timestamps
    end
  end
end
