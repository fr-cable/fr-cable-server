class Config

  property client_in_url, server_in_url, client_out_url, server_out_url

  def initialize
    @client_in_url = "/ws"
    @server_in_url = "/http"

    @client_out_url = ""
    @server_out_url = "localhost:3000/fr_cable_connection"
  end
end