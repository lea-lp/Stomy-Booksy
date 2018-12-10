class EstablishmentsController < ApplicationController


  def show
    @teachers = Teacher.all.order(:email)
    @establishment = Establishment.find(params[:id])
    @teachers =  @teachers.select {|s| !@establishment.teachers.include?(s)}

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
    @establishments = Establishment.all
  end

  def dashboard
    filter_user_allowed

    @establishment = current_user

    @resources = @establishment.resources.order(created_at: :desc)
    @resource = Resource.new

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
