class RemoveFieldNameFromTableName < ActiveRecord::Migration
  def change
    remove_column :users, :role, :string
  end
end
