class GoodsController < ApplicationController
  def create
    good = current_user.goods.build(review_id: params[:review_id])
    good.save
    bad = Bad.find_by(user_id: current_user.id, review_id: params[:review_id])
    bad.destroy
    redirect_to request.referer
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, review_id: params[:review_id])
    good.destroy
    redirect_to request.referer
  end
end
