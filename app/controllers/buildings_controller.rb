class BuildingsController < ActionController::Base
  skip_before_action :authenticate
  respond_to :json

  def create
    @building = Building.create!(building_params)
    @building.create_flooors_and_elevators()
    render template: 'buildings/show', status: :created
  end

  private

  def building_params
    params.require(:building).permit(:name, :floor_count, :elevator_count)
  end
end
