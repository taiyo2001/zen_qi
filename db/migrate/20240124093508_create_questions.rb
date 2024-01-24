class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, comment: "質問" do |t|
      t.references :user, null: false, foreign_key: true, comment: "質問したユーザ"
      t.string :title, comment: "質問タイトル"
      t.text :content, comment: "質問内容"
      t.boolean :private, comment: "公開するかどうか"
      t.integer :status, limit: 2, null: false, default: 0, comment: "すステータス(draft:0, active:10, inactive:20)"
      t.integer "goods_count", default: 0, null: false, comment: "いいね数"
      t.integer "comments_count", default: 0, null: false, comment: "コメント数"

      t.timestamps
    end
  end
end
