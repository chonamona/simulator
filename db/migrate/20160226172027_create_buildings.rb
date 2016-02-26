class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name, index:true, unique:true
      t.integer :floor_count
      t.integer :elevator_count
      t.timestamps null: false
    end
  end
end
