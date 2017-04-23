class MockupsController < ApplicationController
  def pupil
     @user = User.where(role: "pupil").first
     @logs = @user.lesson_logs.group(:lesson_id)
  end

  def logs
     @user = User.where(role: "pupil").first
     @logs = @user.lesson_logs.where(lesson_id: params[:id])
     @latest_log = @logs.first
     @pastlogs = @logs.offset(1)
  end

  def lesson
     @lesson = Lesson.find(params[:id])
  end
end
