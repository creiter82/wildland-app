json.array!(@personnel_qualifications) do |personnel_qualification|
  json.extract! personnel_qualification, :id, :personnel_id, :qualification_id
  json.url personnel_qualification_url(personnel_qualification, format: :json)
end
