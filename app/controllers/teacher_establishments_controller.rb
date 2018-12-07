class TeacherEstablishmentsController < ApplicationController

  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @establishment = Establishment.find(params[:id])
    unless @establishment == current_establishment || @teacher == current_teacher
      flash[:danger] = "Vous n'êtes pas autorisé à faire cette action!"
      redirect_to(root_path)
    return
    end
    @establishment.teachers.delete(@teacher)
    redirect_back(fallback_location: root_path)
  end


  def create
    @establishment = current_establishment
    p @establishment.id
    # @establishment = Establishment.find(params[:establishment_id])
    @teacher = Teacher.find(params[:teacher_id])
    unless @establishment == current_establishment
      flash[:danger] = "Vous n'êtes pas autorisé à faire cette action!"
    redirect_to(root_path)
    end
    @establishment.teachers << @teacher
    flash[:success] = "Le professeur a été ajoutée."
    redirect_back(fallback_location: root_path)
  end

end
