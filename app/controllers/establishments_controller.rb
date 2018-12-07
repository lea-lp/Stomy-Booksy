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
  end
end
