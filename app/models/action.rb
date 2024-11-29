class Action < ApplicationRecord
  enum status: [ :'en cours', :'complétée' ]
  belongs_to :user
  belongs_to :ticket
end
