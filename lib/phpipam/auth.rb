module Auth
  def authenticate(username, password)
    response = self.class.post("/#{app_name}/user/", basic_auth: {username: username, password: password})
    response["data"]["token"]
  end
end
