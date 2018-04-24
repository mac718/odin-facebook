class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :gender
      t.string :occupation
      t.text :bio
      t.string :avatar

      t.timestamps
    end
  end
end
