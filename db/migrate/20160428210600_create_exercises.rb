class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :sentence

      t.timestamps null: false
    end
  end
end
