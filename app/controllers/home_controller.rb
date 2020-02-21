class HomeController < ApplicationController
  def top
    if user_signed_in?
      @timeline_items = current_user.timeline.page(params[:page]).reverse_order
    end
  end

  def about
  end
end
