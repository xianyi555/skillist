class AddReferenceToSkillOfCategorie < ActiveRecord::Migration[5.1]
  def change
    add_reference :skills, :category, foreign_key: true
  end
end
