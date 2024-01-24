class CreateQuestionCommentThreadGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :question_comment_thread_goods, comment: "質問コメントのスレッド内コメントのいいね" do |t|
      t.references :user, null: false, foreign_key: true, index: true, comment: "いいねを押したユーザ"
      t.references :question_comment_thread, null: false, foreign_key: true, index: false, comment: "いいねを押された質問コメントのスレッド内コメント"
      t.integer :status, limit: 2, null: false, default: 0, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
      t.index [:user_id, :question_comment_thread_id], unique: true, name: 'index_unique_user_thread_for_thread_goods'
      # index名を変更するためにreferencesではなくここで指定
      t.index [:question_comment_thread_id], unique: true, name: 'index_thread_goods_on_thread_id'
      t.timestamps
    end
  end
end
