# frozen_string_literal: true
module Vlans
  def all_vlans(token)
    self.class.get("#{app_url}/vlans/", :headers => {'token' => token})
  end

  def vlan(vlan_id, token)
    self.class.get("#{app_url}/vlans/#{vlan_id}/", :headers => {'token' => token})
  end

  def vlan_search(vlan_id, token)
    self.class.get("#{app_url}/vlans/#{vlan_id}/", :headers => {'token' => token})
  end

  def create_vlan(name, number, description, token)
    options = {:query => {:name => name,
                          :number => number,
                          :description => description}, :headers => {'token' => token}}
    self.class.post("#{app_url}/vlans/", options)
  end

  def delete_vlan(vlan_id, token)
    options = {:query => {:id => vlan_id}, :headers => {'token' => token}}
    self.class.delete("#{app_url}/vlan/", options)
  end
end
