class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :description
      t.integer :cost

      t.timestamps
    end
  end
end
