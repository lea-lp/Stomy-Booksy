class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
    @sub_categories = SubCategory.all
    @sub_categories =  @sub_categories.select {|s| !@teacher.sub_categories.include?(s)}
  end

  def destroy
  end

  def edit
  end
end
