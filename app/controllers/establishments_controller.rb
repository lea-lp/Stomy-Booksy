class EstablishmentsController < ApplicationController
before_action :filter_on_signed_in, only: [:dashboard]
before_action :page_belongs_to_user?, only: [:dashboard]



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

  def index
    if params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @establishments = @teacher.establishments
    else
      @establishments = Establishment.all.order(name: :asc)
    end
  end

  def dashboard
    unless current_user == Establishment.find(params[:establishment_id])
      flash[:danger] = "Vous n'êtes pas autorisé à accéder à cette page"
      redirect_to root_path
      return
    end

    @establishment = current_user
    @events = @establishment.events

    @resources = @establishment.resources.order(name: :asc)
    @resource = Resource.new

    @services = @establishment.services.order(created_at: :desc)
    @service = Service.new

    @teachers = Teacher.all.order(email: :asc)
    @my_teachers = @establishment.teachers

    @sub_categories = SubCategory.all.order(title: :asc)

    if params[:search_resource]
      @resource_calendar = Resource.find(params[:search_resource])
    else 
      @resource_calendar = @resources.first
    end 

    @participants = []
    @events.each do |event|
      @participants << event.student
    end 
    @participant = @participants.uniq!

    if @participant == nil
    @participant = []
    end 

    p "*" * 50
    p @participant.inspect
    p "*" * 50
    p @participant.class


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
