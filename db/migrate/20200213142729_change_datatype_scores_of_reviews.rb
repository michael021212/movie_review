class ChangeDatatypeScoresOfReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :total_score, :float
    change_column :reviews, :story_score, :float
    change_column :reviews, :direction_score, :float
    change_column :reviews, :acting_score, :float
    change_column :reviews, :visual_score, :float
    change_column :reviews, :music_score, :float
  end
end
