class ChatroomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def show
    @chatroom = Chatroom.includes(:messages).find_by(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = current_user.chatrooms.build(chatroom_params)
    if @chatroom.save
      flash[:success] = 'Chatroom added!'
      redirect_to chatrooms_path
    else
      render 'new'
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
