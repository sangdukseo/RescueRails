# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111125233947) do

  create_table "adopters", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "status"
    t.string   "when_to_call"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "dog_reqs"
  end

  create_table "adoption_apps", :force => true do |t|
    t.integer  "adopter_id"
    t.string   "spouse_name",               :limit => 50
    t.string   "other_household_names"
    t.date     "ready_to_adopt_dt"
    t.string   "house_type",                :limit => 40
    t.boolean  "has_yard"
    t.boolean  "has_fence"
    t.boolean  "has_parks"
    t.text     "dog_exercise"
    t.string   "dog_stay_when_away",        :limit => 100
    t.integer  "max_hrs_alone",                            :default => 8
    t.string   "dog_at_night",              :limit => 100
    t.text     "dog_vacation"
    t.boolean  "have_pets"
    t.boolean  "had_pets"
    t.text     "current_pets"
    t.string   "current_pets_fixed",        :limit => 50
    t.text     "why_not_fixed"
    t.text     "prior_pets"
    t.boolean  "current_pets_uptodate"
    t.text     "current_pets_uptodate_why"
    t.string   "vet_name",                  :limit => 100
    t.string   "vet_phone",                 :limit => 15
    t.string   "landlord_name",             :limit => 100
    t.string   "landlord_phone",            :limit => 15
    t.text     "rent_dog_restrictions"
    t.integer  "rent_deposit",                             :default => 0
    t.integer  "rent_increase",                            :default => 0
    t.integer  "annual_cost_est",                          :default => 0
    t.text     "plan_training"
    t.boolean  "has_new_dog_exp"
    t.text     "surrender_pet_causes"
    t.text     "training_explain"
    t.text     "surrendered_pets"
    t.text     "why_adopt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adoption_apps", ["adopter_id"], :name => "index_adoption_apps_on_adopter_id"

  create_table "adoptions", :force => true do |t|
    t.integer  "adopter_id"
    t.integer  "dog_id"
    t.string   "relation_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adoptions", ["adopter_id", "dog_id"], :name => "index_connections_on_adopter_id_and_dog_id", :unique => true
  add_index "adoptions", ["adopter_id"], :name => "index_connections_on_adopter_id"
  add_index "adoptions", ["dog_id"], :name => "index_connections_on_dog_id"

  create_table "breeds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "breeds", ["name"], :name => "index_breeds_on_name"

  create_table "dogs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tracking_id"
    t.integer  "primary_breed_id"
    t.integer  "secondary_breed_id"
    t.string   "status"
    t.string   "age",                :limit => 75
    t.string   "size",               :limit => 75
    t.boolean  "is_altered"
    t.string   "gender",             :limit => 6
    t.boolean  "is_special_needs"
    t.boolean  "no_dogs"
    t.boolean  "no_cats"
    t.boolean  "no_kids"
    t.text     "description"
    t.boolean  "is_purebred"
    t.integer  "user_id"
    t.date     "foster_start_date"
    t.date     "adoption_date"
  end

  add_index "dogs", ["age"], :name => "index_dogs_on_age"
  add_index "dogs", ["gender"], :name => "index_dogs_on_gender"
  add_index "dogs", ["name"], :name => "index_dogs_on_name"
  add_index "dogs", ["primary_breed_id"], :name => "index_dogs_on_primary_breed_id"
  add_index "dogs", ["secondary_breed_id"], :name => "index_dogs_on_secondary_breed_id"
  add_index "dogs", ["size"], :name => "index_dogs_on_size"
  add_index "dogs", ["user_id"], :name => "index_dogs_on_user_id"

  create_table "histories", :force => true do |t|
    t.integer  "dog_id"
    t.integer  "user_id"
    t.date     "foster_start_date"
    t.date     "foster_end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "dog_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["dog_id"], :name => "index_photos_on_dog_id"

  create_table "references", :force => true do |t|
    t.integer  "adopter_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "references", ["adopter_id"], :name => "index_references_on_adopter_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",                  :default => false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "is_foster",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
