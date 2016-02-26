class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.integer :idx, index:true, null:false
      t.string :name
      t.belongs_to :building, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
