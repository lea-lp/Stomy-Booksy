class ApplicationController < ActionController::Base
  helper_method :user_signed_in?, :current_user, :get_user_type, :get_logout, :filter_on_signed_in, :get_css_color, :get_dashboard, :get_profil, :page_belongs_to_user?

  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_locale

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:avatar, :name, :address, :last_name, :first_name, :email, :phone, :siret, :description, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:avatar, :name, :last_name, :first_name, :email, :phone, :siret, :description, :password, :password_confirmation, :current_password)}
  end

  def filter_on_signed_in
    unless user_signed_in?
      flash[:danger] = "Vous devez etre connecté pour accéder à cette page"
      redirect_to new_student_session_path
    end
  end

  def user_signed_in? 
    return student_signed_in? || teacher_signed_in? || establishment_signed_in?
  end

  def current_user
    if current_student
      return current_student
    elsif current_teacher
      return current_teacher
    elsif current_establishment
      return current_establishment
    end
  end

  def get_user_id
    @student = Student.find(params[:id])
    @teacher = Teacher.find(params[:id])
    @establishment = Establishment.find(params[:id])
  end

  def get_user_type
    if current_user
      return current_user.class.name
    else
      return false
    end
  end

  def get_logout
    if student_signed_in?
      return destroy_student_session_path
    elsif teacher_signed_in?
      return destroy_teacher_session_path
    elsif establishment_signed_in?
      return destroy_establishment_session_path
    else
      return ""
    end
  end

  def get_dashboard(user)
    if student_signed_in?
      return student_dashboard_path(user)
    elsif teacher_signed_in?
      return teacher_dashboard_path(user)
    elsif establishment_signed_in?
      return establishment_dashboard_path(user)
    else
      return ""
    end
  end

  def get_profil(user_object)
    if student_signed_in?
      return student_path(user_object)
    elsif teacher_signed_in?
      return teacher_path(user_object)
    elsif establishment_signed_in?
      return establishment_path(user_object)
    else
      return ""
    end
  end

  def get_css_color(class_name)
   if class_name == "Student"
     return "warning"
    elsif class_name == "Teacher"
      return "danger"
    elsif class_name == "Establishment"
      return "success"
    end
  end

  def page_belongs_to_user?(object)
    unless current_user == object.teacher || current_user == object.student || current_user == object.establishment
      flash[:danger] = "Vous n'êtes pas autorisé à accéder à cette page. Veuillez vous connecter"
      redirect_to new_student_session_path
    end 
  end

  private

  def set_locale
    I18n.locale = "fr"
  end 

end
