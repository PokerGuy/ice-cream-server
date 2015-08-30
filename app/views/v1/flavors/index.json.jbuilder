json.flavors @flavors.each do |f|
  json.id f.id
  json.name f.name
  json.stock_quantity f.stock_quantity
  json.price f.price.to_f
  json.description f.description
  json.ingredients f.ingredients
  if f.stock_quantity > 0
    json.available true
  end
end