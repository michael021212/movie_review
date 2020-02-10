class BadsController < ApplicationController
  def create
    bad = current_user.bads.build(review_id: params[:review_id])
    bad.save
    redirect_to request.referer
  end

  def destroy
    bad = Bad.find_by(user_id: current_user.id, review_id: params[:review_id])
    bad.destroy
    redirect_to request.referer
  end
end
