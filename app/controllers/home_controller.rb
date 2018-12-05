class HomeController < ApplicationController
  def index
  end

  def dashboard
    @user_type = current_user.class.name
    @current_user = current_user

    # If establishment retrieve sub_categories list
    if current_user.class.name == "Establishment"

      @sub_cat_array = []
      current_user.teachers.each do |teacher|
        teacher.sub_categories.each do |sub_cat|
          @sub_cat_array << sub_cat.title
        end
      end
      @sub_cat_array = @sub_cat_array.uniq.sort
    end
  end
end
