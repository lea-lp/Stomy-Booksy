class HomeController < ApplicationController


  def index
    @establishments = Establishment.all
  end

end
