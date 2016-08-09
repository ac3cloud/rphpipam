module Vrfs
  def all_vrfs(token)
    self.class.get("/#{app_name}/vrfs/", headers: {'token' => token})
  end

  def vrf(vrf_id, token)
    self.class.get("/#{app_name}/vrf/#{vrf_id}/", headers: {'token' => token})
  end

  def create_vrf(name, rd, description, token)
    options = {query: {'name' => name, 'rd' => rd, 'description' => description}, headers: {'token' => token}}
    self.class.post("/#{app_name}/vrf/", options)
  end

  def delete_vrf(vrf_id, token)
    options = {query: {'id' => vrf_id}, headers: {'token' => token}}
    self.class.delete("/#{app_name}/vrf/", options)
  end
end
