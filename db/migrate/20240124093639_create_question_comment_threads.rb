class CreateQuestionCommentThreads < ActiveRecord::Migration[7.0]
  def change
    create_table :question_comment_threads, comment: "質問コメントのスレッド内コメント" do |t|
      t.references :question_comment, null: false, foreign_key: true, comment: "スレッドが投稿されている質問コメント"
      t.references :user, null: false, foreign_key: true, comment: "スレッドを作成したユーザ"
      t.text :content, null: false, comment: "スレッド内容"
      t.integer :goods_count, null: false, default: 0, comment: "いいね数"

      t.timestamps
    end
  end
end
