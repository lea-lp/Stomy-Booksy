class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  def edit
    filter_user_allowed
  end

  def dashboard
    filter_user_allowed
    @student = Student.find(params[:student_id])
    @events = @student.events
  end

  private

  def filter_user_allowed
    if params[:student_id]
      user_id = params[:student_id]
    elsif params[:id]
      user_id = params[:id]
    else
      user_id = 0
    end
      
    unless current_user == Student.find(user_id)
      flash[:danger] = "Vous n'êtes pas autorisé à accéder à cette page"
      redirect_to root_path
    end
  end
end
