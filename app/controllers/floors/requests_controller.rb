module Floors
  class RequestsController < ApplicationController
    before_action :find_floor

    def create
      @request = @floor.requests.create(rq_params)
      @floor.update(waiting: 1)
      @elevator = Elevator.closest(@floor.idx, @request.direction)
      if @elevator
        @elevator.update(moving:1, direction:@request.direction, destination:@floor.idx)
      end
      render template: 'requests/show', status: :created
    end

    private

    def rq_params
      params.require(:request).permit(:direction)
    end

    def find_floor
      @floor = Floor.find(params[:floor_id])
    end
  end
end
