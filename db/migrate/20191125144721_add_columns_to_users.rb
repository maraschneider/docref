class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :clinic, foreign_key: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_picture, :string
    add_column :users, :title, :string
    add_column :users, :position, :string
    add_column :users, :bio, :text
    add_column :users, :only_private_insurance, :boolean
  end
end
