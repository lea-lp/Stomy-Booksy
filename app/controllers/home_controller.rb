class HomeController < ApplicationController
  def index
    @establishments = Establishment.all
  end

  def dashboard
    @user_type = get_user_type
    @current_user = current_user

    # If establishment
    if @user_type == "Establishment"
      @resources = @current_user.resources
    end
  end
end
