require 'spec_helper'

describe Attendance do

    before(:each) do
        @user = Factory(:user)
        @attendee = Factory(:user, :email => Factory.next(:email))
        @attended = Factory(:moim, :user => @user)
        @attendance = @attendee.attendances.build(:attended_id => @attended.id)
    end

    it "should create a new instance given valid attributes" do
        @attendance.save!
    end

    describe "attend methods" do

        before(:each) do
            @attendance.save
        end

        it "should have a attendee attribute" do
            @attendance.should respond_to(:attendee)
        end

        it "should have the right attendee" do
            @attendance.attendee.should == @attendee
        end

        it "should have a attended attribute" do
            @attendance.should respond_to(:attended)
        end

        it "should have the right attended user" do
            @attendance.attended.should == @attended
        end
    end

    describe "validations" do

        it "should require a attendee_id" do
            @attendance.attendee_id = nil
            @attendance.should_not be_valid
        end

        it "should require a attended_id" do
            @attendance.attended_id = nil
            @attendance.should_not be_valid
        end
    end


end
