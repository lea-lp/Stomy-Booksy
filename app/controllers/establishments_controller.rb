class EstablishmentsController < ApplicationController


  def show
    @establishment = Establishment.find(params[:id])
    
    @teachers_all = Teacher.all.order(:email)
    @teachers_all =  @teachers_all.select {|s| !@establishment.teachers.include?(s)}

    @sub_cat_hash = Hash.new
    @establishment.teachers.each do |teacher|
      teacher.sub_categories.each do |sub_cat|
        @sub_cat_hash[sub_cat.title] ||= []
        @sub_cat_hash[sub_cat.title] << teacher
      end
    end
  end

  def edit
    filter_user_allowed

    @establishment = Establishment.find(params[:id])
  end

  def index
    if params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @establishments = @teacher.establishments
    else
      @establishments = Establishment.all
    end
  end

  def dashboard
    filter_user_allowed

    @establishment = current_user
    @events = @establishment.events

    @resources = @establishment.resources.order(created_at: :desc)
    @resource = Resource.new

    @services = @establishment.services.order(created_at: :desc)
    @service = Service.new

    @teachers = Teacher.all.order(email: :asc)

    @sub_categories = SubCategory.all.order(title: :asc)

    if params[:search_resource]
      @resource_calendar = Resource.find(params[:search_resource])
    else 
      @resource_calendar = @resources.first
    end 

  end

  private

  def filter_user_allowed
    if params[:establishment_id]
      user_id = params[:establishment_id]
    elsif params[:id]
      user_id = params[:id]
    else
      user_id = 0
    end
      
    unless current_user == Establishment.find(user_id)
      flash[:danger] = "Vous n'êtes pas autorisé à accéder à cette page"
      redirect_to root_path
    end
  end
end
