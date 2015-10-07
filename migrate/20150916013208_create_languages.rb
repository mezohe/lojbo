class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :iso_code

      t.timestamps null: false
    end
  end
end
