class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.belongs_to :word
      t.belongs_to :language
      t.string :body

      t.timestamps null: false
    end
  end
end
