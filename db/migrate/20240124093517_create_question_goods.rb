class CreateQuestionGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :question_goods, comment: "質問のいいね" do |t|
      t.references :user, null: false, foreign_key: true, index: true, comment: "いいねを押したユーザ"
      t.references :question, null: false, foreign_key: true, index: true, comment: "いいねを押された質問"
      t.integer :status, limit: 2, null: false, default: 0, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
      t.index [:user_id, :question_id], unique: true, name: 'index_unique_user_question_for_question_goods'

      t.timestamps
    end
  end
end
