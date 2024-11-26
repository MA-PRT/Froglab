class Ticket < ApplicationRecord
  enum status: [ :new, :ongoing, :solved ]
  enum priority: [ :very_low, :low, :medium, :high, :very_high ]

  belongs_to :user
  belongs_to :team
  belongs_to :manager, class_name: "User", optional: true
  has_many :actions
  has_many :comments

end
