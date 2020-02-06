class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :image_id, :string
    add_column :users, :birthday, :date
    add_column :users, :sex, :integer
    add_column :users, :intro, :text
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
