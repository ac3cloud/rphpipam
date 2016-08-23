# frozen_string_literal: true
module Subnets
  def subnets(subnet_id, token)
    self.class.get("#{app_url}/subnets/#{subnet_id}/", :headers => {'token' => token})
  end

  def get_folder(subnet_id, token)
    self.class.get("#{app_url}/folders/#{subnet_id}/", :headers => {'token' => token})
  end

  def subnet_usage(subnet_id, token)
    self.class.get("#{app_url}/subnets/#{subnet_id}/usage/", :headers => {'token' => token})
  end

  def subnet_slaves(subnet_id, token)
    self.class.get("#{app_url}/subnets/#{subnet_id}/slaves/", :headers => {'token' => token})
  end

  def subnet_addresses(subnet_id, token)
    self.class.get("#{app_url}/subnets/#{subnet_id}/addresses/", :headers => {'token' => token})
  end

  def subnet_cidr(subnet_cidr, mask, token)
    self.class.get("#{app_url}/subnets/#{subnet_cidr}/#{mask}/", :headers => {'token' => token})
  end

  def create_subnet(cidr, section_id, description, token)
    get_cidr = IPAddress cidr
    options = {:query => {:subnet => get_cidr.address,
                          :mask => get_cidr.prefix,
                          :sectionId => section_id,
                          :description => description}, :headers => {'token' => token}}
    self.class.post("#{app_url}/subnets/", options)
  end

  def update_subnet(subnet_id, description, token)
    options = {:query => {:id => subnet_id,
                          :description => description}, :headers => {'token' => token}}
    self.class.patch("#{app_url}/subnets/", options)
  end

  def delete_subnet(subnet_id, section_id, token)
    options = {:query => {:id => subnet_id,
                          :sectionId => section_id}, :headers => {'token' => token}}
    self.class.delete("#{app_url}/subnets/", options)
  end
end
