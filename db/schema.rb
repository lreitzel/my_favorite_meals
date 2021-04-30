
ActiveRecord::Schema.define(version: 2021_04_22_223547) do

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "meal"
    t.string "location"
    t.date "date"
    t.text "body"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
  end

end
