class ArticleCommentGood < ApplicationRecord
  belongs_to :user
  belongs_to :article_comment

  counter_culture :article_comment, column_name: proc { |model| model.active? ? 'goods_count' : nil }

  # status (
  # active: アクティブ,
  # inactive：非アクティブ
  # )
  enum status: { active: 0, inactive: 10 }

  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :user_id, presence: true
  validates :article_comment_id, presence: true
  validates_uniqueness_of :user_id, scope: :article_comment_id
end
