class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.integer :word_id
      t.integer :language_id
      t.string :body

      t.timestamps null: false
    end
  end
end
