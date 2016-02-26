class Floor < ActiveRecord::Base
  belongs_to :building
  has_many :requests, dependent: :destroy

  scope :top, -> () do order('idx desc').first end
  scope :bottom, -> () do order('idx asc').first end
end
