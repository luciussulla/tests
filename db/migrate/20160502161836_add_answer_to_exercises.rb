class AddAnswerToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :answer, :string
  end
end
