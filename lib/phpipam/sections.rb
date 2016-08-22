# frozen_string_literal: true
module Sections
  def all_sections(token)
    self.class.get("#{app_url}/sections/", :headers => {'token' => token})
  end

  def section_with_id(section_id, token)
    self.class.get("#{app_url}/sections/#{section_id}/", :headers => {'token' => token})
  end

  def section_with_name(section_name, token)
    self.class.get("#{app_url}/sections/#{section_name}/", :headers => {'token' => token})
  end

  def section_subnets(section_id, token)
    self.class.get("#{app_url}/sections/#{section_id}/subnets/", :headers => {'token' => token})
  end

  def create_section(name, description, permissions, strict_mode, token)
    options = {:query => {:name => name,
                          :description => description,
                          :permissions => permissions,
                          :strictMode => strict_mode}, :headers => {'token' => token}}
    self.class.post("#{app_url}/sections/", options)
  end

  def update_section(section_id, token)
    options = {:query => {:id => section_id}, :headers => {'token' => token}}
    self.class.patch("#{app_url}/sections/", options)
  end

  def delete_section(section_id, token)
    options = {:query => {:id => section_id}, :headers => {'token' => token}}
    self.class.delete("#{app_url}/sections/", options)
  end
end
