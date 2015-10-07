class CreateJboClasses < ActiveRecord::Migration
  def change
    create_table :jbo_classes do |t|
      t.belongs_to :word, index: true, foreign_key: true
      t.string :code

      t.timestamps null: false
    end
  end
end
