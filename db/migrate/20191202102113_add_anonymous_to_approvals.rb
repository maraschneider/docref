class AddAnonymousToApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :approvals, :anonymous, :boolean, default: true
  end
end
