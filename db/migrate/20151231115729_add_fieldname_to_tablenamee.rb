class AddFieldnameToTablenamee < ActiveRecord::Migration
  def change
    add_column :documents, :fileimg_path, :string
  end
end
