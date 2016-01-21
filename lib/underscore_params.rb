module UnderscoreParams
  def self.process(params)
    converted = {}
    params.each_pair do |key, value|
      converted[key.to_s.gsub('-','_').to_sym] = value
    end
    converted
  end
end
