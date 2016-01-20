class Documents < ActiveRecord::Migration
  def change
    create_join_table :clients, :documents do |t|
      t.index [:client_id, :document_id]
      t.index [:document_id, :client_id]
    end
  end
end
