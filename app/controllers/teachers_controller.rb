class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
    @sub_categories = SubCategory.all
    @sub_categories =  @sub_categories.select {|s| !@teacher.sub_categories.include?(s)}
  end

  def destroy_relation_teacher_subcat
    @teacher = Teacher.find(params[:teacher_id])
    @sub_categorie = SubCategory.find(params[:sub_category_id])
    unless @teacher == current_teacher
      flash[:danger] = "Vous n'êtes pas autorisé à faire cette action!"
    redirect_to(root_path)
    end
    @teacher.sub_categories.delete(@sub_categorie)
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  def edit
  end
end
