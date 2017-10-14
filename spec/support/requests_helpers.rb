# DRY json parsing
module JsonHelpers
  def json
    JSON.parse(response.body)
  end
end

# Authentication Header helper
module RequestHelpers
  def auth_token(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token

    "JWT #{token}"
  end
end
