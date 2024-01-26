# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_25_222105) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.string "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "article_comment_goods", comment: "記事コメントのいいね", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "いいねを押したユーザ"
    t.bigint "article_comment_id", null: false, comment: "いいねを押された記事コメント"
    t.integer "status", limit: 2, default: 0, null: false, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_comment_id"], name: "index_article_comment_goods_on_article_comment_id"
    t.index ["user_id", "article_comment_id"], name: "index_unique_user_article_comment_for_article_comment_goods", unique: true
    t.index ["user_id"], name: "index_article_comment_goods_on_user_id"
  end

  create_table "article_comments", comment: "記事コメント", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "コメントしたユーザ"
    t.bigint "article_id", null: false, comment: "コメントされた記事"
    t.text "content", null: false, comment: "コメント内容"
    t.integer "goods_count", default: 0, null: false, comment: "いいね数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_comments_on_article_id"
    t.index ["user_id"], name: "index_article_comments_on_user_id"
  end

  create_table "article_goods", comment: "記事のいいね", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "いいねを押したユーザ"
    t.bigint "article_id", null: false, comment: "いいねを押された記事"
    t.integer "status", limit: 2, default: 0, null: false, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_goods_on_article_id"
    t.index ["user_id", "article_id"], name: "index_unique_user_article_for_article_goods", unique: true
    t.index ["user_id"], name: "index_article_goods_on_user_id"
  end

  create_table "article_stocks", comment: "記事のストック", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ストックしたユーザ"
    t.bigint "article_id", null: false, comment: "ストックされた記事"
    t.integer "status", limit: 2, default: 0, null: false, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_stocks_on_article_id"
    t.index ["user_id", "article_id"], name: "index_unique_user_article_for_article_stocks", unique: true
    t.index ["user_id"], name: "index_article_stocks_on_user_id"
  end

  create_table "article_tags", comment: "記事のタグ", force: :cascade do |t|
    t.bigint "article_id", null: false, comment: "タグ付けされた記事"
    t.bigint "tag_id", null: false, comment: "対象のタグ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id", "tag_id"], name: "index_unique_article_tag_for_article_tags", unique: true
    t.index ["article_id"], name: "index_article_tags_on_article_id"
    t.index ["tag_id"], name: "index_article_tags_on_tag_id"
  end

  create_table "articles", comment: "記事", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "記事を作成したユーザ"
    t.string "title", comment: "記事タイトル"
    t.text "content", comment: "記事内容"
    t.boolean "private", comment: "公開するかどうか"
    t.integer "status", limit: 2, default: 0, null: false, comment: "ステータス(draft:0, active:10, inactive:20)"
    t.integer "goods_count", default: 0, null: false, comment: "いいね数"
    t.integer "stocks_count", default: 0, null: false, comment: "ストック数"
    t.integer "comments_count", default: 0, null: false, comment: "コメント数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "organization_fellowships", comment: "オーガナイゼーションのフォロー", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "フォローしたユーザ"
    t.bigint "organization_id", null: false, comment: "フォローされたオーガナイゼーション"
    t.integer "status", limit: 2, default: 0, null: false, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_fellowships_on_organization_id"
    t.index ["user_id", "organization_id"], name: "index_unique_user_organization_for_organization_fellowships", unique: true
    t.index ["user_id"], name: "index_organization_fellowships_on_user_id"
  end

  create_table "organizations", comment: "オーガナイゼーション", force: :cascade do |t|
    t.string "name", comment: "オーガナイゼーション名"
    t.string "discription", comment: "説明"
    t.integer "followers_count", default: 0, null: false, comment: "フォロワー数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_comment_goods", comment: "質問コメントのいいね", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "いいねを押したユーザ"
    t.bigint "question_comment_id", null: false, comment: "いいねを押された質問コメント"
    t.integer "status", limit: 2, default: 0, null: false, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_comment_id"], name: "index_question_comment_goods_on_question_comment_id"
    t.index ["user_id", "question_comment_id"], name: "index_unique_user_question_comment_for_question_comment_goods", unique: true
    t.index ["user_id"], name: "index_question_comment_goods_on_user_id"
  end

  create_table "question_comment_thread_goods", comment: "質問コメントのスレッド内コメントのいいね", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "いいねを押したユーザ"
    t.bigint "question_comment_thread_id", null: false, comment: "いいねを押された質問コメントのスレッド内コメント"
    t.integer "status", limit: 2, default: 0, null: false, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_comment_thread_id"], name: "index_thread_goods_on_thread_id", unique: true
    t.index ["user_id", "question_comment_thread_id"], name: "index_unique_user_thread_for_thread_goods", unique: true
    t.index ["user_id"], name: "index_question_comment_thread_goods_on_user_id"
  end

  create_table "question_comment_threads", comment: "質問コメントのスレッド内コメント", force: :cascade do |t|
    t.bigint "question_comment_id", null: false, comment: "スレッドが投稿されている質問コメント"
    t.bigint "user_id", null: false, comment: "スレッドを作成したユーザ"
    t.text "content", null: false, comment: "スレッド内容"
    t.integer "goods_count", default: 0, null: false, comment: "いいね数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_comment_id"], name: "index_question_comment_threads_on_question_comment_id"
    t.index ["user_id"], name: "index_question_comment_threads_on_user_id"
  end

  create_table "question_comments", comment: "質問コメント", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "コメントしたユーザ"
    t.bigint "question_id", null: false, comment: "コメントされた質問"
    t.text "content", null: false, comment: "コメント内容"
    t.integer "goods_count", default: 0, null: false, comment: "いいね数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_comments_on_question_id"
    t.index ["user_id"], name: "index_question_comments_on_user_id"
  end

  create_table "question_goods", comment: "質問のいいね", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "いいねを押したユーザ"
    t.bigint "question_id", null: false, comment: "いいねを押された質問"
    t.integer "status", limit: 2, default: 0, null: false, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_goods_on_question_id"
    t.index ["user_id", "question_id"], name: "index_unique_user_question_for_question_goods", unique: true
    t.index ["user_id"], name: "index_question_goods_on_user_id"
  end

  create_table "questions", comment: "質問", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "質問したユーザ"
    t.string "title", comment: "質問タイトル"
    t.text "content", comment: "質問内容"
    t.boolean "private", comment: "公開するかどうか"
    t.integer "status", limit: 2, default: 0, null: false, comment: "すステータス(draft:0, active:10, inactive:20)"
    t.integer "goods_count", default: 0, null: false, comment: "いいね数"
    t.integer "comments_count", default: 0, null: false, comment: "コメント数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", comment: "タグ名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_fellowships", comment: "ユーザのフォロー", force: :cascade do |t|
    t.bigint "follower_id", null: false, comment: "フォローしたユーザ"
    t.bigint "followee_id", null: false, comment: "フォローされたユーザ"
    t.integer "status", limit: 2, default: 0, null: false, comment: "ステータス(アクティブ:0, 非アクティブ:10)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_user_fellowships_on_followee_id"
    t.index ["follower_id", "followee_id"], name: "index_unique_follower_followee_for_user_fellowships", unique: true
    t.index ["follower_id"], name: "index_user_fellowships_on_follower_id"
  end

  create_table "users", comment: "ユーザ", force: :cascade do |t|
    t.string "email", null: false, comment: "メールアドレス"
    t.string "encrypted_password", null: false, comment: "ハッシュ化されたパスワード"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", comment: "ユーザ名"
    t.string "nickname", comment: "ニックネーム"
    t.string "profile", comment: "紹介文"
    t.string "url", comment: "URL"
    t.string "location", comment: "ロケーション"
    t.boolean "initial_setting", default: false, null: false, comment: "初期設定が完了したか"
    t.integer "followers_count", default: 0, null: false, comment: "フォロワー数"
    t.integer "followees_count", default: 0, null: false, comment: "フォロー数"
    t.integer "articles_count", default: 0, null: false, comment: "記事投稿数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "article_comment_goods", "article_comments"
  add_foreign_key "article_comment_goods", "users"
  add_foreign_key "article_comments", "articles"
  add_foreign_key "article_comments", "users"
  add_foreign_key "article_goods", "articles"
  add_foreign_key "article_goods", "users"
  add_foreign_key "article_stocks", "articles"
  add_foreign_key "article_stocks", "users"
  add_foreign_key "article_tags", "articles"
  add_foreign_key "article_tags", "tags"
  add_foreign_key "articles", "users"
  add_foreign_key "organization_fellowships", "organizations"
  add_foreign_key "organization_fellowships", "users"
  add_foreign_key "question_comment_goods", "question_comments"
  add_foreign_key "question_comment_goods", "users"
  add_foreign_key "question_comment_thread_goods", "question_comment_threads"
  add_foreign_key "question_comment_thread_goods", "users"
  add_foreign_key "question_comment_threads", "question_comments"
  add_foreign_key "question_comment_threads", "users"
  add_foreign_key "question_comments", "questions"
  add_foreign_key "question_comments", "users"
  add_foreign_key "question_goods", "questions"
  add_foreign_key "question_goods", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "user_fellowships", "users", column: "followee_id"
  add_foreign_key "user_fellowships", "users", column: "follower_id"
end
