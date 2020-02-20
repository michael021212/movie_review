class GoodsController < ApplicationController
  def create
    good = current_user.goods.build(review_id: params[:review_id])
    good.save
    bad = Bad.find_by(user_id: current_user.id, review_id: params[:review_id])
    if bad.present?
      bad.destroy
    end
    redirect_to request.referer, notice: "GOODに追加しました"
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, review_id: params[:review_id])
    good.destroy
    redirect_to request.referer, alert: "GOODから削除しました"
  end
end
