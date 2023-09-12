class Role < ApplicationRecord
  validates_presence_of :name

  has_many :memberships
end