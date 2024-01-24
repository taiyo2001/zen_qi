class QuestionCommentThread < ApplicationRecord
  belongs_to :question_comment
  belongs_to :user

  has_many :question_comment_thread, dependent: :destroy

  validates :content, presence: true
end
