class AddDestinationToElevator < ActiveRecord::Migration
  def change
    add_column :elevators, :destination, :integer, null:true #floor idx destination
  end
end
