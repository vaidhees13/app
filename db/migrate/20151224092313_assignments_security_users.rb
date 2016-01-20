class AssignmentsSecurityUsers < ActiveRecord::Migration
  def change
    create_join_table :clients, :teams do |t|
      t.index [:client_id, :team_id]
      t.index [:team_id, :client_id]
    end
  end
end
