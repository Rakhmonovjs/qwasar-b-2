class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end