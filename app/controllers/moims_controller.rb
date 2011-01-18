class MoimsController < ApplicationController
  before_filter :authenticate  , :only => [:create, :destroy, :update, :edit]
  before_filter :authorized_user, :only => [:destroy, :update, :edit]
  
  
  def create
    @moim  = current_user.moims.build(params[:moim])
    if @moim.save
      flash[:success] = "Moim created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end


  def destroy
    @moim.destroy
    redirect_back_or root_path
  end
  
  private
    def authorized_user
        @moim = Moim.find(params[:id])
        redirect_to root_path unless current_user?(@moim.user)
    end
  
end
