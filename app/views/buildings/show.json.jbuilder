json.building do
  json.partial! 'buildings/building', building: @building
  json.floors @building.floors.order('idx desc'), partial: 'floors/floor', as: :floor
end
