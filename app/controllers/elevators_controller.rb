class ElevatorsController < ApplicationController
  skip_before_action :authenticate
  before_action :find_elevator
  respond_to :json


  def update
    closed_doors = params[:elevator][:closed_doors] # 1-closed, 0-open
    @elevator.update(moving: closed_doors, floor_idx: params[:elevator][:floor_idx])
    render template: 'elevators/show', status: :ok
  end

  private

  def find_elevator
    @elevator = Elevator.find(params[:id])
  end
end
