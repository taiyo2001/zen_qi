class CreateQuestionCommentGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :question_comment_goods, comment: "質問コメントのいいね" do |t|
      t.references :user, null: false, foreign_key: true, index: true, comment: "いいねを押したユーザ"
      t.references :question_comment, null: false, foreign_key: true, index: true, comment: "いいねを押された質問コメント"
      t.integer :status, limit: 2, null: false, default: 0, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
      t.index [:user_id, :question_comment_id], unique: true, name: 'index_unique_user_question_comment_for_question_comment_goods'

      t.timestamps
    end
  end
end
