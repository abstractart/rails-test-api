module Api
  module V1
    # Controller for creating messages
    # Authentication required
    class MessagesController < ApiController
      before_action :authenticate_user

      def create
        message = current_user.messages.build(message_params)

        if message.save
          render json: message, status: :created
        else
          render_errors(message)
        end
      end

      def message_params
        params.require(:message).permit(:text)
      end
    end
  end
end
