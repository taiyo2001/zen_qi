class CreateArticleCommentGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :article_comment_goods, comment: "記事コメントのいいね" do |t|
      t.references :user, null: false, foreign_key: true, index: true, comment: "いいねを押したユーザ"
      t.references :article_comment, null: false, foreign_key: true, index: true, comment: "いいねを押された記事コメント"
      t.integer :status, limit: 2, null: false, default: 0, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
      t.index [:user_id, :article_comment_id], unique: true, name: 'index_unique_user_article_comment_for_article_comment_goods'

      t.timestamps
    end
  end
end
