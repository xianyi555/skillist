class AddPropernameToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :proper_name, :text
  end
end
