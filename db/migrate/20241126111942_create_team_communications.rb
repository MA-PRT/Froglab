class CreateTeamCommunications < ActiveRecord::Migration[7.1]
  def change
    create_table :team_communications do |t|
      t.references :communication, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
