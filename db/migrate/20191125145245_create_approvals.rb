class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.string :headline
      t.text :content
      t.references :specialty, foreign_key: true
      t.references :giver, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
