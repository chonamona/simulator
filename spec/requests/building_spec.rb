require "spec_helper"
require "rails_helper"
require "json"

def headers()
  {
      "Accept" => "application/json; version=1",
      "Content-Type" => "application/json"
  }
end

describe "Building API" do
  describe "POST /building" do
    it "creates building with x number of floors/elevators" do
      b = {building:{name:'My Building', floor_count:10, elevator_count:10}}
      post "/buildings", b.to_json, headers
      expect(response.status).to eq 201
      r = (JSON.parse response.body)['building']
      expect(r['id']).to eq Building.first.id
      expect(r['name']).to eq b[:building][:name]
      expect(r['floor_count']).to eq b[:building][:floor_count]
      expect(r['elevator_count']).to eq b[:building][:elevator_count]
      expect(Floor.count).to eq b[:building][:floor_count]
      expect(Elevator.count).to eq b[:building][:elevator_count]
      expect(r['floors'].length).to eq Floor.count
      expect(r['floors'][0]['id']).to eq Floor.last.id
    end
  end
end
