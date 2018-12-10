class HomeController < ApplicationController


  def index
    @establishments = Establishment.all
  end

  def dashboard

    filter_on_signed_in
    @user_type = get_user_type
    @current_user = current_user
    @resource = Resource.new

    # If establishment
    if @user_type == "Establishment"
      @resources = @current_user.resources
      @teachers = Teacher.all.order(:email)
      @establishment = current_user
      @teachers =  @teachers.select {|s| !@establishment.teachers.include?(s)}
    end

    #rooms availables

    # KQtiti add if user = esta to work on dashboard as teach/student
    if @user_type == "Establishment"
      @active = []
      @resources.each do |resource|
        if resource.is_active == true
        @active << resource
        end
      end
    end
    # KQtiti


    if @user_type == "Teacher"
      @teacher = current_user
      @sub_categories = SubCategory.all
      @sub_categories =  @sub_categories.select {|s| !@teacher.sub_categories.include?(s)}
    end
    # inutile? KQtiti
    # @teachers = Establishment.find(@current_user.id).teachers

  end

end
