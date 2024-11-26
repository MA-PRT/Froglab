class Communication < ApplicationRecord
  belongs_to :user
  has_many :team_communications
  has_many :teams, through: :team_communications
end
