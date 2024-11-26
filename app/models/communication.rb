class Communication < ApplicationRecord
  belongs_to :user
  has_many :team_communications, dependent: :destroy
  has_many :teams, through: :team_communications
end
