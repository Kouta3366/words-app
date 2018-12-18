class HomeController < ApplicationController
  def about
  end

  def top
    @lists = List.where(user_id: @current_user.id)
  end
end
