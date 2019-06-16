class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :headline
      t.text :body
      t.string :status
      t.references :creator
      t.references :writer
      t.references :reviewer

      t.timestamps
    end
  end
end
