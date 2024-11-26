class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets
  has_many :managed_tickets, class_name: 'Ticket', foreign_key: 'manager_id'
  has_many :team_memberships, class_name: 'TeamMember'
  has_many :teams, through: :team_memberships
  has_many :communications
  has_many :comments
  has_many :actions
end
