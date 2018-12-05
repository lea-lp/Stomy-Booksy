class EstablishmentsController < ApplicationController


  def show
    @establishment = Establishment.find(params[:id])
    @sub_cat_hash = Hash.new
    @establishment.teachers.each do |teacher|
      teacher.sub_categories.each do |sub_cat|
        @sub_cat_hash[sub_cat.category.title+" - "+sub_cat.title] ||= []
        @sub_cat_hash[sub_cat.category.title+" - "+sub_cat.title] << teacher
      end
    end
    puts "*" *60
    puts @sub_cat_hash
    puts "*" *60
  end


  def edit
  end
end
