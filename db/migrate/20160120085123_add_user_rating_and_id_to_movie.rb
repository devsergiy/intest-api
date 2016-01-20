class AddUserRatingAndIdToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :user_rating, :float
    add_reference :movies, :user, index: true
  end
end
