class PagesController < ApplicationController

    def home
        @title = "Home"
        if signed_in?
            @moim = Moim.new
            @feed_items = current_user.feed.paginate(:page => params[:page])
        end
        @moims = Moim.paginate(:page => params[:page])       
    end

    def contact
        @title = "Contact"
    end

    def about
        @title = "About"
    end

    def help
        @title = "Help"
    end

end
