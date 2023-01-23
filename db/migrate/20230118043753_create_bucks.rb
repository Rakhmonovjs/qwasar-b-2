class CreateBucks < ActiveRecord::Migration[7.0]
  def change
    create_table :bucks do |t|
      t.string :name
      t.references :bucket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
