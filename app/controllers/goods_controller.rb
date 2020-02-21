class GoodsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    good = current_user.goods.build(review_id: params[:review_id])
    good.save
    bad = Bad.find_by(user_id: current_user.id, review_id: params[:review_id])
    if bad.present?
      bad.destroy
    end
    @msg = "GOODに追加しました"
  end

  def destroy
    @review = Review.find(params[:review_id])
    good = Good.find_by(user_id: current_user.id, review_id: params[:review_id])
    good.destroy
    @msg = "GOODから削除しました"
  end
end
