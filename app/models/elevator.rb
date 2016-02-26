class Elevator < ActiveRecord::Base
  belongs_to :building

  scope :closest, ->(floor_idx, direction) do
    if exists?(moving:0, floor_idx: floor_idx)
      # lucky path with static elevator available for this floor
      return where(moving:0, floor_idx: self.floor.idx).order('name').first
    end
    if direction==1
      #going up elevator
      e = where('moving=1 and direction=1 and floor_idx < ?', floor_idx).order('floor_idx desc').first
      if e
        return e
      end
    end
    if direction==0
      #going down elevator
      e = where('moving=1 and direction=1 and floor_idx > ?', floor_idx).order('floor_idx desc').first
      if e
        return e
      end
    end
    # closes static elevator
    return where(moving:0).order("abs(floor_idx - #{floor_idx})").first
  end
end
