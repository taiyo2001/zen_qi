class CreateArticleTags < ActiveRecord::Migration[7.0]
  def change
    create_table :article_tags, comment: "記事のタグ" do |t|
      t.references :article, null: false, foreign_key: true, index: true, comment: "タグ付けされた記事"
      t.references :tag, null: false, foreign_key: true, index: true, comment: "対象のタグ"
      t.index [:article_id, :tag_id], unique: true, name: 'index_unique_article_tag_for_article_tags'

      t.timestamps
    end
  end
end
