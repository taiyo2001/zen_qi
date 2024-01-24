class CreateOrganizationFellowships < ActiveRecord::Migration[7.0]
  def change
    create_table :organization_fellowships, comment: "オーガナイゼーションのフォロー" do |t|
      t.references :user, null: false, foreign_key: true, index: true, comment: "フォローしたユーザ"
      t.references :organization, null: false, foreign_key: true, index: true, comment: "フォローされたオーガナイゼーション"
      t.integer :status, limit: 2, null: false, default: 0, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
      t.index [:user_id, :organization_id], unique: true, name: 'index_unique_user_organization_for_organization_fellowships'

      t.timestamps
    end
  end
end
