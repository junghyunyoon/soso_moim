class MoimsController < ApplicationController
  before_filter :authenticate  , :only => [:create, :destroy, :update, :edit]
  before_filter :authorized_user, :only => [:destroy, :update, :edit]
  
  def index
      @title = "All moims"
      @moims = Moim.paginate(:page => params[:page])
  end



  def attendees
    @title = "Attendees"
    @moim = Moim.find(params[:id])
    @users = @moim.attendees.paginate(:page => params[:page])
    render 'show_attendees'
  end

  def show
      @moim = Moim.find(params[:id])
  end
  
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
 
 def new
    @moim = Moim.new
 end 
 
 def edit 
    @title = "Edit moim"
 end
 
 def update
     @moim = Moim.find(params[:id])
     if @moim.update_attributes(params[:moim])
         flash[:success] = "Moim updated."
         redirect_to current_user
     else
         @title = "Edit moim"
         render 'edit'
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
