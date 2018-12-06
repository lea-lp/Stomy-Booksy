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

end
