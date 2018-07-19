module Api
  module V1
    # Controller for creating messages
    # Authentication required
    class MessagesController < ApiController
      before_action :authenticate_user, only: :create

      def index
        messages = Message.by_create_time.page(params[:page]).includes(:user)

        response.headers['X-Total-Pages-Count'] = messages.total_pages
        render json: messages
      end

      def search
        messages = Message.search(
          params[:query],
          page: params[:page],
          per_page: Message::PAGE_SIZE
        )
        
        render json: messages
      end

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
