class ArticleStock < ApplicationRecord
  belongs_to :user
  belongs_to :article

  counter_culture :article, column_name: proc { |model| model.active? ? 'stocks_count' : nil }

  # status (
  # active: アクティブ,
  # inactive：非アクティブ
  # )
  enum status: { active: 0, inactive: 10 }

  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :user_id, presence: true
  validates :article_id, presence: true
  validates_uniqueness_of :user_id, scope: :article_id
end
