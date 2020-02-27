class RemoveSpoilerFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :spoiler, :boolean
  end
end
