class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :article_goods
  has_many :article_comments
  has_many :article_comment_goods
  has_many :questions
  has_many :question_goods
  has_many :question_comments
  has_many :question_comment_goods
  has_many :question_comment_threads
  has_many :question_comment_thread_goods
  has_many :tags, through: :articles

  has_one_attached :image

  before_create :set_default_image

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  with_options if: :initial_setting? do |init|
    init.validates :name, presence: true
    init.validates :nickname, presence: true
    init.validates :image, presence: true
  end

  private

  def set_default_image
    return if image.attached?

    image_path = Rails.root.join('app', 'assets', 'images', 'user_default_image.png')
    image.attach(io: File.open(image_path), filename: 'user_default_image.png', content_type: 'image/png')
  end
end
