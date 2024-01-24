class OrganizationFellowship < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  counter_culture :organization, column_name: 'followers_count'

  validates :user_id, presence: true
  validates :organization_id, presence: true
  validates_uniqueness_of :user_id, scope: :organization_id
end
