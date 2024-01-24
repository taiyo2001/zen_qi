class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, comment: "記事" do |t|
      t.references :user, null: false, foreign_key: true, comment: "記事を作成したユーザ"
      t.references :tag, null: true, foreign_key: true, comment: "属するタグ"
      t.string :title, comment: "記事タイトル"
      t.text :content, comment: "記事内容"
      t.boolean :private, comment: "公開するかどうか"
      t.integer :status, limit: 2, null: false, default: 0, comment: "すステータス(draft:0, active:10, inactive:20)"
      t.integer "goods_count", default: 0, null: false, comment: "いいね数"
      t.integer "stocks_count", default: 0, null: false, comment: "ストック数"
      t.integer "comments_count", default: 0, null: false, comment: "コメント数"

      t.timestamps
    end
  end
end
