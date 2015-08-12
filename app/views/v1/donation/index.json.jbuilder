json.donations @donations.each do |d|
  json.name d.name
  json.amount d.amount
  json.created_at d.created_at
end