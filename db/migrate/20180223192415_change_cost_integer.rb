class ChangeCostInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :skills, :cost, :string
  end
end
