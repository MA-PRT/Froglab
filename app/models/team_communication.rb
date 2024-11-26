class TeamCommunication < ApplicationRecord
  belongs_to :communication
  belongs_to :team
end
