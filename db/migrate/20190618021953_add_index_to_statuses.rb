class AddIndexToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_index :statuses, :name, unique: true
  end
end
