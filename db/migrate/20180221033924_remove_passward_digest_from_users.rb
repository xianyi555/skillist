class RemovePasswardDigestFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :passward_digest, :string
  end
end
