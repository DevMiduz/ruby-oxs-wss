require 'faye/websocket'

# WebSocketServer
class WebSocketServer
  def call(env)
    if Faye::WebSocket.websocket?(env)
      ws = Faye::WebSocket.new(env)

      ws.on :message do |event|
        ws.send(event.data)
      end

      ws.on :close do |event|
        p [:close, event.code, event.reason]
        ws = nil
      end

      # Return async Rack response
      ws.rack_response
    else
      [200, { 'Content-Type' => 'text/plain' }, ['Hello World']]
    end
  end
end
