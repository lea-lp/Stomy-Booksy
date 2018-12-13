class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
    @sub_categories = SubCategory.all.order(title: :asc)
    @sub_categories =  @sub_categories.select {|s| !@teacher.sub_categories.include?(s)}
  end

  def destroy
  end

  def edit
    filter_user_allowed
  end

  def dashboard
    filter_user_allowed
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

  private

  def filter_user_allowed
    if params[:teacher_id]
      user_id = params[:teacher_id]
    elsif params[:id]
      user_id = params[:id]
    else
      user_id = 0
    end
      
    unless current_user == Teacher.find(user_id)
      flash[:danger] = "Vous n'êtes pas autorisé à accéder à cette page"
      redirect_to root_path
    end
  end
    

end
