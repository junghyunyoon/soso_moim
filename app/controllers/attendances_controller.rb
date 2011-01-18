class AttendancesController < ApplicationController
  before_filter :authenticate

  def create
    @moim = Moim.find(params[:attendance][:attended_id])
    current_user.attend!(@moim)
    respond_to do |format|
       format.html { redirect_to @moim }
       format.js
     end

  end

  def destroy
    @moim = Attendance.find(params[:id]).attended
    current_user.unattend!(@moim)
    respond_to do |format|
         format.html { redirect_to @moim }
         format.js
    end
  end
end


  