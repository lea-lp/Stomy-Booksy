class TeachersController < ApplicationController
before_action :filter_on_signed_in, only: [:dashboard]
before_action :page_belongs_to_user?, only: [:dashboard]

  def show
    @teacher = Teacher.find(params[:id])
    @sub_categories = SubCategory.all.order(title: :asc)
    @sub_categories =  @sub_categories.select {|s| !@teacher.sub_categories.include?(s)}
  end

  def destroy
  end

  def dashboard
    @teacher = Teacher.find(params[:teacher_id])
    @events = @teacher.events
    
  end

  def index
    if params[:establishment_id]
      @establishment = Establishment.find(params[:establishment_id])
      @teachers = @establishment.teachers
    else
      @teachers = Teacher.all
    end
  end
end
