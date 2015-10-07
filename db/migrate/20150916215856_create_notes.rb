class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.belongs_to :word, index: true, foreign_key: true
      t.belongs_to :language, index: true, foreign_key: true
      t.string :body

      t.timestamps null: false
    end
  end
end
