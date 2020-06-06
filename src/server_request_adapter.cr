class ServerRequestParams
  JSON.mapping(
    type: String,
    payload: JSON::Any
  )
end

class MessageParams
  JSON.mapping(
    room: String,
    message: JSON::Any
  )
end

class ServerRequestAdapter

  property app

  def initialize(@app : App)
    
  end

  def in_request(env)
    params = ServerRequestParams.from_json(env.request.body.not_nil!)
    type = params.type
    payload = params.payload

    puts "By server: #{params.type} #{params.payload}"

    case type
    when "message"
      @app.server_in_request_processor.process_message(payload["room"].to_s, payload["message"].to_s)
    when "accept_connection"
      @app.server_in_request_processor.process_accept_connection(payload.to_s)
    when "deny_connection"
      @app.server_in_request_processor.process_deny_connection(payload.to_s)
    when "accept_subscription"
      @app.server_in_request_processor.process_accept_subscription(payload.to_s)
    when "deny_subscription"
      @app.server_in_request_processor.process_deny_subscription(payload.to_s)
    when "add_server"
      @app.server_in_request_processor.process_add_server(payload["uuid"].to_s)
    else
      #
    end
  end

  def out_request(server : StructServer, payload : String)
    puts "To server: #{payload}"
    HTTP::Client.post(server.server_url, body: payload)
  end
end