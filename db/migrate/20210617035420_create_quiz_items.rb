class CreateQuizItems < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_items do |t|
      t.integer :qid
      t.string :question
      t.string :description
      t.text :answers
      t.string :multiple_correct_answers
      t.text :correct_answers
      t.string :explanation
      t.string :tip
      t.text :tags
      t.string :category
      t.string :difficulty

      t.timestamps
    end
  end
end
