class InterestsController < ApplicationController
  def create
    interest = current_user.interests.build(movie_id: params[:movie_id], title: params[:title], poster_path: params[:poster_path])
    interest.save
    redirect_to request.referer
  end

  def destroy
    interest = current_user.interests.find_by(movie_id: params[:movie_id])
    interest.destroy
    redirect_to request.referer
  end
end
