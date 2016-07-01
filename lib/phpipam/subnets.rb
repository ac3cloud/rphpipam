module Subnets
  def subnets(subnet_id, token)
    self.class.get("/#{app_name}/subnets/#{subnet_id}/" , headers: {"token" => token})
  end

  def subnet_usage(subnet_id, token)
    self.class.get("/#{app_name}/subnets/#{subnet_id}/usage/" , headers: {"token" => token})
  end

  def subnet_slaves(subnet_id, token)
    self.class.get("/#{app_name}/subnets/#{subnet_id}/slaves/" , headers: {"token" => token})
  end

  def subnet_addresses(subnet_id, token)
    self.class.get("/#{app_name}/subnets/#{subnet_id}/addresses/" , headers: {"token" => token})
  end

  def subnet_cidr(subnet_cidr, mask, token)
    self.class.get("/#{app_name}/subnets/#{subnet_cidr}/#{mask}/" , headers: {"token" => token})
  end

  def create_subnet(cidr, mask, description, token)
    get_cidr = IPAddr.new(cidr)
    options = { "subnet" => get_cidr, "mask" => mask, "description" => description, headers: {"token" => token}}
    self.class.post("/#{app_name}/subnets/", options)
  end
end
