require "spec_helper"
require "rails_helper"
require "json"

def headers()
  {
      "Accept" => "application/json; version=1",
      "Content-Type" => "application/json"
  }
end

describe "Floor API" do
  describe "POST /floors/:id/requests" do
    it "Requests an elevator" do
      # Create Building
      b = {building:{name:'My Building', floor_count:10, elevator_count:10}}
      post "/buildings", b.to_json, headers
      expect(Floor.top.waiting).to eq 0

      # Request Elevator from top floor
      rq = {request: {direction:0}}
      post "/floors/#{Floor.top.id}/requests", rq.to_json, headers()
      expect(response.status).to eq 201
      expect(Request.count).to eq 1
      expect(Floor.top.waiting).to eq 1
      r = (JSON.parse response.body)['request']
      expect(r['id']).to eq Request.first.id
      expect(r['direction']).to eq rq[:request][:direction]
    end
  end
end
