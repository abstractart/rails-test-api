module Api
  module V1
    # Controller for messages voting
    # Authentication required
    class VotesController < ApiController
      before_action :authenticate_user
      before_action :set_message

      def create
        vote = Vote.new(user: current_user, message: @message)

        if vote.save
          head :created
        else
          render_errors(vote)
        end
      end

      def set_message
        @message = Message.find(params[:message_id])
      end
    end
  end
end
