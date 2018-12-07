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
    end

    #rooms availables
    @active = []
    @resources.each do |resource|
      if resource.is_active == true
      @active << resource
     end
    end

    @teachers = Establishment.find(@current_user.id).teachers

  end

end
