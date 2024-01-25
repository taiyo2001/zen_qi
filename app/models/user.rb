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

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :nickname, presence: true
end
