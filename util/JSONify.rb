require 'json'

class JSONify
  def hash(options=[])
    dict = {}
    self.instance_variables.each do |var|
      dict[var] = self.instance_variable_get var
    end
    dict
  end

  def deserialize(string)
    JSON.load(string).each do |var, val|
      self.instance_variable_set(var, val)
    end
  end
end

