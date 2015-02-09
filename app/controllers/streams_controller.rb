class StreamsController < ApplicationController

include ActionController::Live
require 'sse'
  def new
    response.headers['Content-Type'] = 'text/event-stream'
    sse = ServerSide::SSE.new(response.stream)
    begin
      loop do
        sse.write({ :message => "#{params[:message]}" })
        sleep 1
      end
    rescue IOError
    ensure
      sse.close
    end
  end
end




