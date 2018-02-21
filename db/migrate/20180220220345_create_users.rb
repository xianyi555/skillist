class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :city
      t.string :passward_digest
      t.text :profile_img

      t.timestamps
    end
  end
end
