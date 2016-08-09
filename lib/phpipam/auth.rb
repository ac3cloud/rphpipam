module Auth
  def authenticate(username, password)
    options = {basic_auth: {username: username, password: password}}
    response = self.class.post("/#{app_name}/user/", options)
    response['data']['token']
  end
end
