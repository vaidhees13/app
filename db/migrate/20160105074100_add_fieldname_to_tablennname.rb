class AddFieldnameToTablennname < ActiveRecord::Migration
  def change
    add_column :documents, :file_image, :string
  end
end
