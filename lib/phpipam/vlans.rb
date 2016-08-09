module Vlans
  def all_vlans(token)
    self.class.get("/#{app_name}/vlans/", headers: {token: token})
  end

  def vlan(vlan_id, token)
    self.class.get("/#{app_name}/vlans/#{vlan_id}/", headers: {token: token})
  end

  def create_vlan(name, number, description, token)
    options = {query: {name: name,
                       number: number,
                       description: description}, headers: {token: token}}
    self.class.post("/#{app_name}/vlans/", options)
  end

  def delete_vlan(vlan_id, token)
    options = {query: {id: vlan_id}, headers: {token: token}}
    self.class.delete("/#{app_name}/vlan/", options)
  end
end
