class AddWordPromptToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :word_prompt, :string
  end
end
