class DropPeople < ActiveRecord::Migration[5.0]
  def up
    drop_table :people
  end

  def down
    create_table :people do |t|
      t.string :name
      t.string :nameid, index: true, uniq: true

      t.timestamps
    end
  end
end
