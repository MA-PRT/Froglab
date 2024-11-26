class Action < ApplicationRecord
  enum status: [ :ongoing, :solved ]
  belongs_to :user
  belongs_to :ticket
end
