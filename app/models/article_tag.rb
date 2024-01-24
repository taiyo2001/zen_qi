class ArticleTag < ApplicationRecord
  belongs_to :article
  belongs_to :tag

  validates :article_id, presence: true
  validates :tag_id, presence: true
  validates_uniqueness_of :article_id, scope: :tag_id
end
