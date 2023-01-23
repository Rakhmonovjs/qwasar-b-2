class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.integer :status, default: 0 
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
