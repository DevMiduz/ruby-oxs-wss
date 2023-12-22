# frozen_string_literal

require 'rack'
require 'thin'

require_relative 'app/app'

Faye::WebSocket.load_adapter('thin')

Thin::Server.start WebSocketServer.new, 'localhost', 9292
