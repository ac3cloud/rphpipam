# frozen_string_literal: true
module Auth
  def authenticate(username, password)
    options = {:basic_auth => {:username => username, :password => password}}
    response = self.class.post("#{app_url}/user/", options)
    response['data']['token']
  end
end
