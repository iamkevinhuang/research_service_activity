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

ActiveRecord::Schema.define(:version => 20210603024617) do

  create_table "administrators", :force => true do |t|
    t.string   "login"
    t.string   "name"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.integer  "roles_mask"
    t.integer  "current_faculty_id"
    t.string   "current_faculty_title"
    t.string   "current_faculty_abbreviation"
    t.integer  "current_program_id"
    t.string   "current_program_title"
    t.string   "current_program_abbreviation"
    t.integer  "lecturers_page"
    t.string   "lecturers_search"
    t.integer  "students_page"
    t.string   "students_search"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "study_cards_page",               :default => 1
    t.string   "study_cards_search"
    t.integer  "middle_terms_page",              :default => 1
    t.string   "middle_terms_search"
    t.integer  "final_terms_page",               :default => 1
    t.string   "final_terms_search"
    t.integer  "current_year_id"
    t.integer  "current_stage_id"
    t.integer  "students_program_id"
    t.string   "password2"
    t.string   "password2_sample"
    t.string   "study_card_code1"
    t.string   "study_card_code2"
    t.string   "program_limit"
    t.date     "current_attendance_date"
    t.integer  "current_attendance_location_id"
    t.integer  "status_id",                      :default => 1
    t.integer  "current_alumni_stage_id",        :default => 0
    t.integer  "employees_page"
    t.string   "employees_search"
    t.string   "problem_box_limit"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "description"
  end

  create_table "application_configurations", :force => true do |t|
    t.string   "key"
    t.text     "value"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lecturers", :force => true do |t|
    t.string   "code",                                                    :default => ""
    t.string   "name",                                                    :default => ""
    t.string   "place_of_birth"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "handphone"
    t.string   "phone"                                                :default => 1
    t.string   "first_degree_title"
    t.string   "first_degree_major"
    t.string   "first_degree_university"
    t.date     "date_of_first_degree"
    t.string   "second_degree_title"
    t.string   "second_degree_major"
    t.string   "second_degree_university"
    t.date     "date_of_second_degree"
    t.string   "third_degree_title"
    t.string   "third_degree_major"
    t.string   "third_degree_university"
    t.date     "date_of_third_degree"
    t.string   "email"
    t.datetime "created_at",                                                                :null => false
    t.datetime "updated_at",                                                                :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "status_id",                                               :default => 1
    t.string   "tax_code"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "current_year_id",                                         :default => 2016
    t.integer  "current_stage_id",                                        :default => 1
    t.integer  "current_program_id",                                      :default => 1
    t.string   "front_title"
    t.string   "rear_title"
    t.integer  "sex_id",                                                  :default => 0
    t.string   "indonesia_postal_code_id"
    t.string   "nasionality"
  end

 
  create_table "research_service_activities", :force => true do |t|
    t.integer  "status_id",                           :default => 0
    t.integer  "lecturer_id"
    t.integer  "program_id"
    t.integer  "year_id"
    t.integer  "stage_id",                            :default => 1
    t.integer  "type_id",                             :default => 0
    t.string   "title"
    t.integer  "company_contact_title_id",            :default => 0
    t.string   "company_contact_name"
    t.string   "company_title"
    t.date     "implementation_at"
    t.date     "requested_at"
    t.date     "assign_at"
    t.date     "reported_at"
    t.string   "request_sha_id"
    t.string   "assignment_sha_id"
    t.string   "report_sha_id"
    t.string   "article_title"
    t.integer  "publisher_category_id",               :default => 0
    t.string   "publisher_title"
    t.string   "publisher_license_number"
    t.string   "publisher_url"
    t.string   "article_url"
    t.integer  "publisher_year_id"
    t.integer  "publisher_volume_id"
    t.integer  "publisher_number_id"
    t.string   "news_url"
    t.string   "video_url"
    t.string   "request_certificate_file_name"
    t.string   "request_certificate_content_type"
    t.integer  "request_certificate_file_size"
    t.datetime "request_certificate_updated_at"
    t.string   "assignment_certificate_file_name"
    t.string   "assignment_certificate_content_type"
    t.integer  "assignment_certificate_file_size"
    t.datetime "assignment_certificate_updated_at"
    t.string   "report_certificate_file_name"
    t.string   "report_certificate_content_type"
    t.integer  "report_certificate_file_size"
    t.datetime "report_certificate_updated_at"
    t.string   "reply_document_file_name"
    t.string   "reply_document_content_type"
    t.integer  "reply_document_file_size"
    t.datetime "reply_document_updated_at"
    t.string   "copyright_document_file_name"
    t.string   "copyright_document_content_type"
    t.integer  "copyright_document_file_size"
    t.datetime "copyright_document_updated_at"
    t.string   "optional_document_file_name"
    t.string   "optional_document_content_type"
    t.integer  "optional_document_file_size"
    t.datetime "optional_document_updated_at"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  create_table "research_service_activity_logs", :force => true do |t|
    t.integer  "research_service_activity_id"
    t.integer  "status_id"
    t.text     "note"
    t.integer  "lecturer_id"
    t.integer  "administrator_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "research_service_activity_members", :force => true do |t|
    t.integer  "research_service_activity_id"
    t.integer  "position_id"
    t.integer  "lecturer_id"
    t.integer  "status_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "lecturer_number"
    t.string   "lecturer_name"
    t.integer  "lecturer_institution_id"
  end

  create_table "signature_containers", :force => true do |t|
    t.string   "sha_id"
    t.string   "model_name"
    t.integer  "model_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

