class Config

  property client_in_url, server_in_url, client_out_url

  def initialize
    @client_in_url = "/ws"
    @server_in_url = "/http"

    @client_out_url = ""
  end
end