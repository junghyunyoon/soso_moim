require 'spec_helper'

describe Moim do

  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content" }
  end

  it "should create a new instance given valid attributes" do
    @user.moims.create!(@attr)
  end

  describe "user associations" do
    
    before(:each) do
      @moim = @user.moims.create(@attr)
    end

    it "should have a user attribute" do
      @moim.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @moim.user_id.should == @user.id
      @moim.user.should == @user
    end
  end
  
  describe "validations" do

      it "should require a user id" do
        Moim.new(@attr).should_not be_valid
      end

      it "should require nonblank content" do
        @user.moims.build(:content => "  ").should_not be_valid
      end

      it "should reject long content" do
        @user.moims.build(:content => "a" * 141).should_not be_valid
      end
    end
  
  
end
