module ResponseJSON
  def response_json
    JSON.parse(last_response.body)
  end
end

RSpec.configure do |config|
  config.include ResponseJSON
end
