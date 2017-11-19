module Api
  module V1
    # Base API Controller
    class ApiController < ActionController::API
      include Knock::Authenticable

      def render_errors(obj, status: :unprocessable_entity)
        render json: { errors: obj.errors }, status: status
      end
    end
  end
end
