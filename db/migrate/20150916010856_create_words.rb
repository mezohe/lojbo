class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.string :jbo_type

      t.timestamps null: false
    end
  end
end
