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
    @establishment = Establishment.find(params[:id])
  end

  def index
    @establishments = Establishment.all
  end

  def index_of_teachers
    @establishment = Establishment.find(params[:establishment_id])
    @teachers = @establishment.teachers
  end
end
