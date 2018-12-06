class TeacherCatsController < ApplicationController

  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @sub_categorie = SubCategory.find(params[:id])
    unless @teacher == current_teacher
      flash[:danger] = "Vous n'êtes pas autorisé à faire cette action!"
    redirect_to(root_path)
    end
    @teacher.sub_categories.delete(@sub_categorie)
    redirect_back(fallback_location: root_path)
  end

end
