Thread.new do
  if Rails.env.production?
    system("ruby #{Rails.root}/app/controllers/v1/streams_controller.rb --ssl --ssl-key /etc/ssl/zoe-doodle.key --ssl-cert /etc/ssl/zoe-doodle.pem")
  else
    system("ruby #{Rails.root}/app/controllers/v1/streams_controller.rb")
  end
end