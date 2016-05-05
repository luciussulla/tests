class AddTransformToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :transform, :string
  end
end
