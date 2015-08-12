json.blogs @blogs.each do |b|
  json.id b.id
  json.title b.title
end