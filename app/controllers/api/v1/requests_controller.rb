module Api 
  module V1
    class RequestsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authenticate_request, only: [:show]
      def index
        users = User.all
        render json: {data: users.as_json(only: [:name])}, status: :ok
      end
      
      def show
        user = User.find(@key.user_id)
        render json: {data: user.as_json(only: [:name, :email, :created_at])}
      end
      def create
        render json: {status: "ok"}, status: :ok
      end
      private
      
      def authenticate_request
        @key = RestKey.find_by(key: params[:hash])
        render json: {error: "Not Authorized"}, status: :unauthorized if @key.nil?
      end
    end
  end
end
