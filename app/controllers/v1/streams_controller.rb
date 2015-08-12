require 'goliath'
require 'em-hiredis'

class StreamsController < Goliath::API

  def response(env)
    redis = EM::Hiredis.connect
    pubsub = redis.pubsub

    pubsub.subscribe("message") do |message|
      env.stream_send "event: message\ndata: #{message} \n\n"
    end

    streaming_response(200, {'Content-Type' => 'text/event-stream', 'Access-Control-Allow-Origin' => '*'})
  end

end