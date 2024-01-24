class CreateArticleGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :article_goods, comment: "記事のいいね" do |t|
      t.references :user, null: false, foreign_key: true, index: true, comment: "いいねを押したユーザ"
      t.references :article, null: false, foreign_key: true, index: true, comment: "いいねを押された記事"
      t.integer :status, limit: 2, null: false, default: 0, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
      t.index [:user_id, :article_id], unique: true, name: 'index_unique_user_article_for_article_goods'

      t.timestamps
    end
  end
end
