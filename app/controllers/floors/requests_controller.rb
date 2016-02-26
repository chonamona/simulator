module Floors
  class RequestsController < ApplicationController
    before_action :find_floor

    def create
      @request = @floor.requests.create(rq_params)
      @floor.update(waiting: 1)
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
