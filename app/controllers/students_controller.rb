class StudentsController < ApplicationController
  before_action :filter_on_signed_in, only: [:dashboard]
  before_action :page_belongs_to_user?, only: [:dashboard]

  def show
    @student = Student.find(params[:id])
  end

  def dashboard
    @student = Student.find(params[:student_id])
    @events = @student.events
    
  end

end
