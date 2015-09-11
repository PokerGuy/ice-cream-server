Thread.new do
    system("ruby #{Rails.root}/app/controllers/v1/streams_controller.rb")
end