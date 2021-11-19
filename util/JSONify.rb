require 'json'

class JSONify
  def jsonify(options=[])
    hash = {}
    self.instance_variables.each do |var|
      hash[var] = self.instance_variable_get var
    end
    hash.to_json
  end

  def deserialize(string)
    JSON.load(string).each do |var, val|
      self.instance_variable_set(var, val)
    end
  end
end

