class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :origin
      t.integer :destination
      t.belongs_to :elevator, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
