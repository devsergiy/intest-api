class AddDirectorAndActorsToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :director, :string, array: true
    add_column :movies, :actors, :string, array: true
  end
end
