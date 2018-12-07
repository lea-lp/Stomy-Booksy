class TeacherCatsController < ApplicationController

  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @sub_category = SubCategory.find(params[:id])
    unless @teacher == current_teacher
      flash[:danger] = "Vous n'êtes pas autorisé à faire cette action!"
    redirect_to(root_path)
    end
    @teacher.sub_categories.delete(@sub_category)
    flash[:success] = "L'activité a été supprimée."
    redirect_back(fallback_location: root_path)
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @sub_category = SubCategory.find(params[:sub_category_id])
    unless @teacher == current_teacher
      flash[:danger] = "Vous n'êtes pas autorisé à faire cette action!"
    redirect_to(root_path)
    end
    @teacher.sub_categories << @sub_category
    flash[:success] = "L'activité a été ajoutée."
    redirect_back(fallback_location: root_path)
  end

end
