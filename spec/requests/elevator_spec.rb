require "spec_helper"
require "rails_helper"
require "json"

def headers()
  {
      "Accept" => "application/json; version=1",
      "Content-Type" => "application/json"
  }
end

describe "Elevator API" do
  describe "PUT /elevators/:id" do
    it "Reports elevator status" do
      # Create Building
      b = {building:{name:'My Building', floor_count:10, elevator_count:10}}
      post "/buildings", b.to_json, headers
      expect(Floor.top.waiting).to eq 0

      # Request Elevator from top floor
      rq = {request: {direction:0}}
      post "/floors/#{Floor.top.id}/requests", rq.to_json, headers()

      e = Elevator.where(moving:1).first
      expect(e.floor_idx).to eq 0

      # Update Elevator when passing through floor
      p = {elevator:{floor_idx: 1, closed_doors:1}}
      put "/elevators/#{e.id}", p.to_json, headers()
      expect(response.status).to eq 200
      r = (JSON.parse response.body)['elevator']
      expect(r['floor_idx']).to eq p[:elevator][:floor_idx]

      # Update Elevator when opening doors
      p = {elevator:{floor_idx: 2, closed_doors:0}}
      put "/elevators/#{e.id}", p.to_json, headers()
      expect(response.status).to eq 200
      r = (JSON.parse response.body)['elevator']
      expect(r['moving']).to eq 0


      # Update Elevator after doors close
      p = {elevator:{floor_idx: 2, closed_doors:1}}
      put "/elevators/#{e.id}", p.to_json, headers()
      expect(response.status).to eq 200
      expect(e.moving).to eq 1
    end
  end
end
