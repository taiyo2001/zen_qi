class ArticleComment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  has_many :article_comment_goods, dependent: :destroy

  validates :content, presence: true
end
