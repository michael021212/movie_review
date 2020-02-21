class BadsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    bad = current_user.bads.build(review_id: params[:review_id])
    bad.save
    good = Good.find_by(user_id: current_user.id, review_id: params[:review_id])
    if good.present?
      good.destroy
    end
    @msg = "BADに追加しました"
  end

  def destroy
    @review = Review.find(params[:review_id])
    bad = Bad.find_by(user_id: current_user.id, review_id: params[:review_id])
    bad.destroy
    @msg = "BADから削除しました"
  end
end
