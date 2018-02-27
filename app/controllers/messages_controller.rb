class MessagesController < ApplicationController
  def index
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @messages = Message.all
  end

  def new
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @message = Message.new
  end

  def create
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @message = current_user.messages.new(messageParams)
    @message.sender_name = current_user.firstname
    @message.sender_show = current_user.firstname
    @message.receiver_show = @message[:receiver_name]

    if User.find_by(firstname: @message[:receiver_name]) != nil
      flash[:success] = "Message send"
      @message.save
      redirect_to user_path(@user)
    else
      flash[:notice] = "Can't find username #{@message[:receiver_name]}"
      redirect_to user_path(@user)
    end
  end

  def notshowsendmessage
    @message = Message.find_by_id(params[:id])
    @message.update_attributes(:sender_show => nil)
    redirect_back(fallback_location: root_path)
  end

  def notshowreceivemessage
    @message = Message.find_by_id(params[:id])
    @message.update_attributes(:receiver_show => nil)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user = User.find_by_id(session[:user_id])
    @message = Message.all
    @message.destroy_all
    redirect_to user_path(@user)
  end

  private

  def messageParams
    params.require(:message).permit(:content, :receiver_name)
  end
end