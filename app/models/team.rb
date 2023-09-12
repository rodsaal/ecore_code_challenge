class Team < ApplicationRecord
  belongs_to :lead, class_name: 'User'
  has_many :memberships
  has_many :users, through: :memberships
end