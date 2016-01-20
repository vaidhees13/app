class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :author
      t.string :team_name
      t.string :summary
      t.string :ref_link
      t.string :file_path
      t.integer :client_ids

      t.timestamps null: false
    end
  end
end
