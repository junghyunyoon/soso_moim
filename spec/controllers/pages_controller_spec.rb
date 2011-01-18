require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
      @base_title = "Sosohan Moim"
    end

  describe "GET 'home'" do

    describe "when not signed in" do

      before(:each) do
        get :home
      end

      it "should be successful" do
        response.should be_success
      end

      it "should have the right title" do
        response.should have_selector("title",
                                      :content => "#{@base_title} | Home")
      end
    end
    

    describe "when signed in" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @manager = Factory(:user, :email => Factory.next(:email))
        @moim = Factory(:moim, :user => @manager)
        @user.attend!(@moim)
      end

      it "should have the right attending counts" do
        get :home
        response.should have_selector("a", :href => attending_user_path(@user),
                                           :content => "1 attending")

      end
    end
  end


  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                        :content =>
                          "HeadFlow Sosohan Moim | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                        :content =>
                          "HeadFlow Sosohan Moim | About")
    end
  end
end
