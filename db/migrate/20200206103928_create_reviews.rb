class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.integer :user_id
      t.integer :total_score
      t.integer :story_score
      t.integer :direction_score
      t.integer :acting_score
      t.integer :visual_score
      t.integer :music_score
      t.text :body

      t.timestamps
    end
  end
end
