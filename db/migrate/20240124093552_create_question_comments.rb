class CreateQuestionComments < ActiveRecord::Migration[7.0]
  def change
    create_table :question_comments, comment: "質問コメント" do |t|
      t.references :user, null: false, foreign_key: true, comment: "コメントしたユーザ"
      t.references :question, null: false, foreign_key: true, comment: "コメントされた質問"
      t.text :content, null: false, comment: "コメント内容"
      t.integer :goods_count, null: false, default: 0, comment: "いいね数"

      t.timestamps
    end
  end
end
