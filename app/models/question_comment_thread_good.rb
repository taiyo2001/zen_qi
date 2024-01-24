class QuestionCommentThreadGood < ApplicationRecord
  belongs_to :user
  belongs_to :question_comment_thread

  counter_culture :question_comment_thread, column_name: proc { |model| model.active? ? 'goods_count' : nil }

  # status (
  # active: アクティブ,
  # inactive：非アクティブ
  # )
  enum status: { active: 0, inactive: 10 }

  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :user_id, presence: true
  validates :question_comment_thread_id, presence: true
  validates_uniqueness_of :user_id, scope: :question_comment_thread_id
end