class CreateUserFellowships < ActiveRecord::Migration[7.0]
  def change
    create_table :user_fellowships, comment: "ユーザのフォロー" do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }, index: true, comment: "フォローしたユーザ"
      t.references :followee, null: false, foreign_key: { to_table: :users }, index: true, comment: "フォローされたユーザ"

      t.integer :status, limit: 2, null: false, default: 0, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
      t.index [:follower_id, :followee_id], unique: true, name: 'index_unique_follower_followee_for_user_fellowships'

      t.timestamps
    end
  end
end
