class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
    @teacher_hash = Hash.new
    @teacher.establishments.each do |establishment|
      @teacher_hash[establishment.name] ||= []
      @teacher_hash[establishment.name] << establishment
    end
  end

  def destroy
  end


  def edit
  end
end
