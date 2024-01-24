class Article < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  has_many :article_goods, dependent: :destroy
  has_many :article_stocks, dependent: :destroy
  has_many :article_comments, dependent: :destroy
  has_many :article_tags, dependent: :destroy

  # status (
  # draft: 下書き,
  # active: アクティブ,
  # inactive: 非アクティブ(削除)
  # )
  enum status: { draft: 0, active: 10, inactive: 20 }

  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :title, presence: true
  validates :content, presence: true
end
