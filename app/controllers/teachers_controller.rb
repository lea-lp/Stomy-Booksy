class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:id])
    @sub_cat_array = []

puts "*" *60
puts params
puts "*" *60


    @teacher.sub_categories.each do |sub_cat|
      @sub_cat_array << sub_cat.title
    end
    @sub_cat_array = @sub_cat_array.uniq.sort
  end



  def edit
  end
end
