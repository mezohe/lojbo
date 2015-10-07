class CreateEtymologies < ActiveRecord::Migration
  def change
    create_table :etymologies do |t|
      t.belongs_to :word, index: true, foreign_key: true
      t.belongs_to :language, index: true, foreign_key: true
      t.string :etymology
      t.string :roman

      t.timestamps null: false
    end
  end
end
