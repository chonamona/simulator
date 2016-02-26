class AddWaitingToFloor < ActiveRecord::Migration
  def change
    add_column :floors, :waiting, :integer, default:0 #0-not-waiting, 1-waiting-for-elevator
  end
end
