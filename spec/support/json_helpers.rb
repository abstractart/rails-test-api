# DRY json parsing
module JsonHelpers
  def json
    JSON.parse(response.body)
  end
end
