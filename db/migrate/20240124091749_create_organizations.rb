class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations, comment: "オーガナイゼーション" do |t|
      t.string :name, comment: "オーガナイゼーション名"
      t.string :discription, comment: "説明"
      t.integer :followers_count, null: false, default: 0, comment: "フォロワー数"

      t.timestamps
    end
  end
end
