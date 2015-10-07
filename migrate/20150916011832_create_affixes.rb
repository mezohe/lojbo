class CreateAffixes < ActiveRecord::Migration
  def change
    create_table :affixes do |t|
      t.belongs_to :word, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
