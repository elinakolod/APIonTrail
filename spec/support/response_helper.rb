module ResponseHelper
  def response_json
    JSON.parse(response.body) rescue {}
  end

  def json_response
    parsed_response = JSON.parse(response.body)

    if parsed_response.instance_of?(Array)
      parsed_response.map(&:deep_symbolize_keys)
    else
      parsed_response.deep_symbolize_keys
    end
  end
end
