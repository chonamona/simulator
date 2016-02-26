class Building < ActiveRecord::Base
  has_many :floors, dependent: :destroy
  has_many :elevators, dependent: :destroy

  def create_flooors_and_elevators()
    (1..self.floor_count).each{|f| self.floors.create(idx: (f-1), name: "F#{f}")}

    # Starting all elevators on floor 1 for now
    (1..self.elevator_count).each{|e| self.elevators.create(name: "E#{e}", moving:0, floor_idx: 0)}
  end
end
