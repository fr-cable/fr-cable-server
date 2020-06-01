require "kemal"

require "./client_in_request_processor.cr"
require "./client_out_request_processor.cr"
require "./client_request_adapter.cr"
require "./server_in_request_processor.cr"
require "./server_out_request_processor.cr"
require "./server_request_adapter.cr"
require "./data_controller.cr"
require "./config.cr"
require "./list_connections.cr"
require "./list_rooms.cr"
require "./list_subscriptions.cr"
require "./struct_connection.cr"
require "./struct_room.cr"
require "./struct_subscription.cr"

class App

  def initialize
    @server_in_request_processor = ServerInRequestProcessor.new(self)
    @server_request_adapter = ServerRequestAdapter.new(self)

  end

  def list_connections
    @list_connections ||= begin
      ListConnections.new
    end
  end

  def list_subscriptions 
    @list_subscriptions  ||= begin
      ListSubscriptions.new
    end
  end

  def list_rooms
    @list_rooms ||= begin
      ListRooms.new
    end
  end

  def client_out_request_processor
    @client_out_request_processor ||= begin
      ClientOutRequestProcessor.new(self)
    end
  end

  def server_out_request_processor
    @server_out_request_processor ||= begin
      ServerOutRequestProcessor.new(self)
    end
  end

  def server_in_request_processor
    @server_in_request_processor ||= begin
      ServerInRequestProcessor.new(self)
    end
  end

  def config
    @config ||= begin
      Config.new
    end
  end

  def data_controller
    @data_controller ||= begin
      DataController.new(self)
    end
  end

  def client_in_request_processor
    @client_in_request_processor ||= begin
      ClientInRequestProcessor.new(self)
    end
  end

  def client_request_adapter
    @client_request_adapter ||= begin
      ClientRequestAdapter.new(self)
    end
  end  
  def server_request_adapter
    @server_request_adapter ||= begin
      ServerRequestAdapter.new(self)
    end
  end

  def run
    ws config.client_in_url do |socket|
      client_request_adapter.in_request(socket)
    end

    post config.server_in_url do |env|
      server_request_adapter.in_request(env)
    end
    Kemal.config.port = 3015
    Kemal.run
  end
end