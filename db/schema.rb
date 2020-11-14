# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_802_105_404) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'followers', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followed_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['followed_id'], name: 'index_followers_on_followed_id'
    t.index %w[follower_id followed_id], name: 'index_followers_on_follower_id_and_followed_id', unique: true
    t.index ['follower_id'], name: 'index_followers_on_follower_id'
  end

  create_table 'hints', force: :cascade do |t|
    t.string 'text'
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_hints_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'fullname'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'image_file_name'
    t.string 'image_content_type'
    t.integer 'image_file_size'
    t.datetime 'image_updated_at'
    t.string 'coverimage_file_name'
    t.string 'coverimage_content_type'
    t.integer 'coverimage_file_size'
    t.datetime 'coverimage_updated_at'
  end

  add_foreign_key 'hints', 'users'
end
