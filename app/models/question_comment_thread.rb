class QuestionCommentThread < ApplicationRecord
  belongs_to :question_comment
  belongs_to :user

  has_many :question_comment_thread_goods, dependent: :destroy

  validates :content, presence: true
end
