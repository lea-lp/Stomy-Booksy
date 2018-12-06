class EstablishmentsController < ApplicationController


  def show
    @establishment = Establishment.find(params[:id])
    @sub_cat_hash = Hash.new
    @establishment.teachers.each do |teacher|
      teacher.sub_categories.each do |sub_cat|
        @sub_cat_hash[sub_cat.title] ||= []
        @sub_cat_hash[sub_cat.title] << teacher
      end
    end
  end

  def destroy_relation_teach_esta
    @teacher = Teacher.find(params[:teacher_id])
    @establishment = Establishment.find(params[:establishment_id])
    unless @establishment == current_establishment || @teacher == current_teacher
      flash[:danger] = "Vous n'êtes pas autorisé à faire cette action!"
      redirect_to(root_path)
    return
    end
    @establishment.teachers.delete(@teacher)
    redirect_back(fallback_location: root_path)
  end

  def edit
  end
end
