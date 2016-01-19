class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :nameid, index: true, uniq: true

      t.timestamps
    end
  end
end
