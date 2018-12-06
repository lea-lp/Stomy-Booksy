class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
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

  def new_sub_cat
    @sub_category = SubCategory.new
  end
      # teacher.sub_categories << SubCategory.find(rand_array_sub_cat[i])


  def destroy
  end

  def edit
  end
end
