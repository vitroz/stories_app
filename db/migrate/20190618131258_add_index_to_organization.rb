class AddIndexToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_index :organizations, :slug, unique: true
  end
end
