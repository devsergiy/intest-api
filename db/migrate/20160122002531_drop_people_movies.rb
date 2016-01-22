class DropPeopleMovies < ActiveRecord::Migration[5.0]
  def up
    drop_table :person_movies
  end

  def down
    create_table :person_movies do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.integer :person_role

      t.timestamps
    end
  end
end
