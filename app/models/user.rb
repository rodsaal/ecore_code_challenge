class User < ApplicationRecord
  has_many :memberships
  has_many :teams, through: :memberships
  has_one :team_lead, class_name: 'Team', foreign_key: 'lead_id'
end