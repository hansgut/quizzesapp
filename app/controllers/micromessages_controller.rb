class MicromessagesController < ApplicationController
  def create
    if current_user.try(:admin?)
      @message = Micromessage.new(micromessage_params)
      @message.save
      redirect_to root_path
    end
  end

  def destroy
    if current_user.try(:admin?)
      @message = Micromessage.find(params[:id])
      @message.destroy
      redirect_to root_path
    end
  end

  private
  def micromessage_params
    params.require(:micromessage).permit(:body)
  end
end
