class AddTitleToInterests < ActiveRecord::Migration[5.2]
  def change
    add_column :interests, :title, :string
    add_column :interests, :poster_path, :string
  end
end
