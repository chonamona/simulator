class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :direction, null:false #0-down, 1-up
      t.belongs_to :floor, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
