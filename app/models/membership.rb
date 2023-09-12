class Membership < ApplicationRecord
  validates_presence_of :user_id, :team_id

  belongs_to :user
  belongs_to :team
  belongs_to :role
end