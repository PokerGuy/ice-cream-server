json.flavors @flavors.each do |f|
  json.id f.id
  json.name f.name
  json.stock_quantity f.stock_quantity
  json.price f.price.to_f
end