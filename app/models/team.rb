class Team < ApplicationRecord
  belongs_to :parent_team, class_name: "Team", optional: true
end
