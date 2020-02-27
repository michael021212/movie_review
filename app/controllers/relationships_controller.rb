class RelationshipsController < ApplicationController
  def create
    relationship = current_user.active_relationships.build(follower_id: params[:user_id])
    relationship.save!
    redirect_to request.referer, notice: "フォローしました"
  end

  def destroy
    relationship = current_user.active_relationships.find_by(follower_id: params[:user_id])
    relationship.destroy!
    redirect_to request.referer, alert: "フォローを解除しました"
  end
end
