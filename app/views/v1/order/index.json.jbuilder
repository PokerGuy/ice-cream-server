json.orders @orders.each do |o|
  json.order do
    json.id o.id
    json.name o.name
    json.phone_number o.phone_number
    json.status o.status
    json.created_at o.created_at
    json.line_items(o.order_line_items) do |li|
      json.flavor li.flavor.name
      json.quantity li.quantity
    end
  end
end