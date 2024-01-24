class CreateArticleStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :article_stocks, comment: "記事のストック" do |t|
      t.references :user, null: false, foreign_key: true, index: true, comment: "ストックしたユーザ"
      t.references :article, null: false, foreign_key: true, index: true, comment: "ストックされた記事"
      t.integer :status, limit: 2, null: false, default: 0, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
      t.index [:user_id, :article_id], unique: true, name: 'index_unique_user_article_for_article_stocks'

      t.timestamps
    end
  end
end
