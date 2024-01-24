class CreateArticleComments < ActiveRecord::Migration[7.0]
  def change
    create_table :article_comments, comment: "記事コメント" do |t|
      t.references :user, null: false, foreign_key: true, comment: "コメントしたユーザ"
      t.references :article, null: false, foreign_key: true, comment: "コメントされた記事"
      t.text :content, null: false, comment: "コメント内容"
      t.integer :goods_count, null: false, default: 0, comment: "いいね数"

      t.timestamps
    end
  end
end
