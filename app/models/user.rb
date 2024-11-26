class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets
  has_many :actions, through: :tickets
  has_many :comments, through: :tickets
  has_many :teams, through: :team_members
  has_many :communications
end
