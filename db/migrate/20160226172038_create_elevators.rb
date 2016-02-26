class CreateElevators < ActiveRecord::Migration
  def change
    create_table :elevators do |t|
      t.string :name
      t.integer :moving, index:true, default:0 #0-static, 1-moving
      t.integer :direction, index:true, null:true #0-down, 1-up
      t.integer :enabled, index:true, default:1 #0-disabled, 1-enabled
      t.integer :floor_idx, index:true

      t.belongs_to :building, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
