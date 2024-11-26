class Team < ApplicationRecord
  belongs_to :parent_team, class_name: "Team", optional: true

  has_many :child_teams, class_name: 'Team', foreign_key: 'parent_team_id'
  has_many :team_memberships, class_name: 'TeamMember'
  has_many :users, through: :team_memberships
  has_many :team_communications
  has_many :communications, through: :team_communications
  has_many :tickets
end
