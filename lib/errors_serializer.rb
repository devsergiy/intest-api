module ErrorsSerializer
  def self.serialize(errors)
    return if errors.nil?

    error_list = errors.to_hash(true).map do |attr, descriptions|
      descriptions.map do |msg|
        {
          "detail" => msg,
          "source" => {
            "pointer" => "data/attributes/#{attr}"
          }
        }
      end
    end.flatten

    { errors: error_list }
  end
end
