class Article < ApplicationRecord
  attr_accessor :text_tags

  after_save :create_tags

  belongs_to :user

  has_many :article_goods, dependent: :destroy
  has_many :article_stocks, dependent: :destroy
  has_many :article_comments, dependent: :destroy
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags

  scope :unprivate, -> { where(private: false).order(created_at: :desc) }

  # status (
  # draft: 下書き,
  # active: アクティブ,
  # inactive: 非アクティブ(削除)
  # )
  enum status: { draft: 0, active: 10, inactive: 20 }

  with_options unless: :draft? do |undraft|
    undraft.validates :title, presence: true
    undraft.validates :content, presence: true
    undraft.validate :validate_article_tags_count
  end
  validates :status, presence: true, inclusion: { in: statuses.keys }

  def create_tags
    raise InvalidValueError, 'Article must have between 1 and 5 tags' if tags.empty? && !valid_tags_count?

    return if text_tags.nil?

    text_tags.split.map do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      ArticleTag.find_or_create_by(article: self, tag:)
    end
  end

  private

  def validate_article_tags_count
    errors.add(:base, 'Article must have between 1 and 5 tags') unless valid_tags_count?
  end

  def valid_tags_count?
    tags_count = text_tags&.split&.uniq&.size
    (1..5).cover?(tags_count)
  end
end
