module Api
  module V1
    # Controller for actions with users
    class UsersController < ApiController
      def create
        user = User.new(user_params)
        if user.save
          render json: {}, status: :created
        else
          render_errors(user)
        end
      end

      def user_params
        params.require(:user).permit(:email, :password, :nickname)
      end
    end
  end
end
