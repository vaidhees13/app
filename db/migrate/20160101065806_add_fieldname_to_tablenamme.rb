class AddFieldnameToTablenamme < ActiveRecord::Migration
  def change
    add_column :documents, :file_name, :string
  end
end
