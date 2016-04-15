json.array!(@rosters) do |roster|
  json.extract! roster, :id, :name, :start_time, :end_time
  json.url roster_url(roster, format: :json)
end
