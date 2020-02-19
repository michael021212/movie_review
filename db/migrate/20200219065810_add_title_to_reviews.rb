class AddTitleToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :poster_path, :string
  end
end
