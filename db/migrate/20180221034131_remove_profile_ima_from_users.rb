class RemoveProfileImaFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :profile_img, :text
  end
end
