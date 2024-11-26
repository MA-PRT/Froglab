class AddParentTeamToTeams < ActiveRecord::Migration[7.1]
  def change
    add_reference :teams, :parent_team, foreign_key: { to_table: :teams }, null: true
  end
end
