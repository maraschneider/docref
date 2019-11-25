class CreateApprovalFields < ActiveRecord::Migration[5.2]
  def change
    create_table :approval_fields do |t|
      t.references :approval, foreign_key: true
      t.references :field, foreign_key: true

      t.timestamps
    end
  end
end
