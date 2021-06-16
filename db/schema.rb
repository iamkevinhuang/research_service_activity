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

  create_table "administrator_histories", :force => true do |t|
    t.integer  "administrator_id"
    t.string   "remote_ip"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "administrator_signature_authorizers", :force => true do |t|
    t.integer  "administrator_id"
    t.string   "name_with_degree"
    t.string   "position"
    t.string   "position_number"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

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

  create_table "agencies", :force => true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "password_digest"
    t.boolean  "status"
    t.string   "referral_code"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "area"
    t.string   "resident_card_id"
    t.string   "resident_card_image_file_name"
    t.string   "resident_card_image_content_type"
    t.integer  "resident_card_image_file_size"
    t.datetime "resident_card_image_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "altissia_enrolments", :force => true do |t|
    t.integer  "altissia_phase_id"
    t.integer  "student_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "altissia_phases", :force => true do |t|
    t.integer  "year_id"
    t.integer  "phase_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "alumni_comments", :force => true do |t|
    t.text     "content"
    t.integer  "alumni_id"
    t.integer  "administrator_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "alumni_examiners", :force => true do |t|
    t.integer  "alumni_id"
    t.integer  "as_id",       :default => 0
    t.integer  "position_id", :default => 0
    t.integer  "lecturer_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "alumni_stages", :force => true do |t|
    t.integer  "year_id"
    t.integer  "period_id"
    t.date     "ceremony_date"
    t.integer  "status_id",     :default => 1
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "alumnis", :force => true do |t|
    t.integer  "program_id"
    t.integer  "student_id"
    t.date     "ceremony_date"
    t.date     "graduation_date"
    t.string   "alumni_number"
    t.string   "certificate_number"
    t.text     "essay_title"
    t.decimal  "ipk_score",                 :precision => 8, :scale => 2, :default => 0.0
    t.integer  "year_start_id"
    t.integer  "status_id",                                               :default => 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.string   "certificate_paper_number"
    t.text     "essay_title_in_indonesia"
    t.text     "essay_title_in_english"
    t.text     "abstract_in_indonesia"
    t.text     "abstract_in_english"
    t.text     "keywords_in_indonesia"
    t.text     "keywords_in_english"
    t.text     "note"
    t.integer  "alumni_stage_id"
    t.string   "specialization"
    t.string   "specialization_in_english"
    t.string   "remarks_number"
    t.string   "graduation_number"
    t.date     "court_date"
    t.string   "certificate_file_name"
    t.string   "certificate_content_type"
    t.integer  "certificate_file_size"
    t.datetime "certificate_updated_at"
    t.string   "transcript_file_name"
    t.string   "transcript_content_type"
    t.integer  "transcript_file_size"
    t.datetime "transcript_updated_at"
  end

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "study_card_item_id"
    t.integer  "score"
    t.text     "explanation"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "application_configurations", :force => true do |t|
    t.string   "key"
    t.text     "value"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "attendance_items", :force => true do |t|
    t.integer  "attendance_id"
    t.integer  "student_id"
    t.integer  "status_id",     :default => 0
    t.string   "note"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "attendances", :force => true do |t|
    t.integer  "lecture_schedule_item_id"
    t.integer  "lecturer_id"
    t.integer  "curriculum_item_id"
    t.datetime "start_lecturer"
    t.datetime "end_lecturer"
    t.integer  "class_room_id"
    t.integer  "status_id",                :default => 0
    t.string   "subject"
    t.string   "assignment"
    t.string   "note"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "administrator_id"
    t.integer  "payment_year_id",          :default => 0
    t.integer  "payment_month_id",         :default => 0
    t.integer  "closed_id",                :default => 0
  end

  create_table "basic_salaries", :force => true do |t|
    t.string   "name"
    t.integer  "salary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "location"
    t.string   "itemid"
    t.string   "fc"
    t.string   "mark"
    t.string   "dewey"
    t.string   "callnumber"
    t.string   "out"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "business_plans", :force => true do |t|
    t.string   "school_name"
    t.string   "school_teacher_name"
    t.string   "handphone"
    t.string   "title"
    t.string   "participant1_name"
    t.string   "participant1_class"
    t.string   "participant1_handphone"
    t.string   "participant1_email"
    t.string   "participant2_name"
    t.string   "participant2_class"
    t.string   "participant2_handphone"
    t.string   "participant2_email"
    t.string   "participant3_name"
    t.string   "participant3_class"
    t.string   "participant3_handphone"
    t.string   "participant3_email"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.text     "note"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "competition_id"
    t.string   "school_teacher_email"
    t.string   "sha_id"
    t.integer  "for_id"
    t.string   "instagram_link"
    t.string   "facebook_link"
  end

  create_table "business_stores", :force => true do |t|
    t.integer  "business_user_id"
    t.string   "title"
    t.string   "from_institution"
    t.string   "name_1"
    t.string   "name_2"
    t.string   "name_3"
    t.string   "name_4"
    t.string   "email_1"
    t.string   "email_2"
    t.string   "email_3"
    t.string   "email_4"
    t.string   "handphone_1"
    t.string   "handphone_2"
    t.string   "handphone_3"
    t.string   "handphone_4"
    t.text     "description"
    t.string   "video_url"
    t.integer  "status_id",                                       :default => 1
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "position_id",                                     :default => 0
    t.decimal  "amount",           :precision => 14, :scale => 2, :default => 0.0
    t.integer  "reviews_id",                                      :default => 0
  end

  create_table "business_top_ups", :force => true do |t|
    t.integer  "administrator_id"
    t.integer  "business_user_id"
    t.decimal  "amount",           :precision => 14, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
  end

  create_table "business_transaction_histories", :force => true do |t|
    t.integer  "business_transaction_id"
    t.integer  "status_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "business_transactions", :force => true do |t|
    t.integer  "business_user_id"
    t.text     "description"
    t.integer  "business_store_id"
    t.integer  "amount",            :default => 0
    t.integer  "status_id",         :default => 1
    t.integer  "review_id",         :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "business_users", :force => true do |t|
    t.string   "login"
    t.string   "name"
    t.string   "password"
    t.string   "handphone"
    t.string   "email"
    t.integer  "roles_mask",                                :default => 0
    t.integer  "status_id",                                 :default => 1
    t.decimal  "amount",     :precision => 14, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "bookcopy_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "carts", :force => true do |t|
    t.integer  "student_id"
    t.integer  "lecturer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "class_rooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "location_id"
    t.integer  "status_id",   :default => 1
    t.integer  "capacity_id", :default => 0
  end

  create_table "coass_departments", :force => true do |t|
    t.string   "name"
    t.integer  "status_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "coass_groups", :force => true do |t|
    t.string   "group_name"
    t.integer  "coass_department_id"
    t.date     "date_in"
    t.date     "date_out"
    t.integer  "lecturer_id"
    t.integer  "year_in"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "coass_study_cards", :force => true do |t|
    t.integer  "student_id"
    t.integer  "coass_group_id"
    t.decimal  "pre_test_score",  :default => 0.0
    t.string   "pre_test_grade"
    t.decimal  "mid_test_score",  :default => 0.0
    t.string   "mid_test_grade"
    t.decimal  "post_test_score", :default => 0.0
    t.string   "post_test_grade"
    t.string   "test_result"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "content_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "copyright_logs", :force => true do |t|
    t.integer  "copyright_id"
    t.integer  "status_id"
    t.text     "note"
    t.integer  "lecturer_id"
    t.integer  "administrator_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "student_id"
  end

  create_table "copyright_members", :force => true do |t|
    t.integer  "position_id"
    t.integer  "copyright_id"
    t.integer  "lecturer_id"
    t.integer  "status_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "student_id"
    t.string   "digital_signature_file_name"
    t.string   "digital_signature_content_type"
    t.integer  "digital_signature_file_size"
    t.datetime "digital_signature_updated_at"
  end

  create_table "copyrights", :force => true do |t|
    t.integer  "type_of_request_id"
    t.integer  "type_of_creation_id"
    t.integer  "type_of_sub_creation_id"
    t.string   "title"
    t.text     "description"
    t.date     "date_of_first_announce"
    t.string   "country_of_first_announce"
    t.integer  "lecturer_id"
    t.integer  "program_id"
    t.integer  "status_id",                           :default => 0
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "example_of_creation_file_name"
    t.string   "example_of_creation_content_type"
    t.integer  "example_of_creation_file_size"
    t.datetime "example_of_creation_updated_at"
    t.string   "proof_transfer_file_name"
    t.string   "proof_transfer_content_type"
    t.integer  "proof_transfer_file_size"
    t.datetime "proof_transfer_updated_at"
    t.string   "statement_letter_file_name"
    t.string   "statement_letter_content_type"
    t.integer  "statement_letter_file_size"
    t.datetime "statement_letter_updated_at"
    t.integer  "student_id"
    t.integer  "type_of_brand_id"
    t.string   "brand_label"
    t.text     "description_of_brand"
    t.integer  "class_id"
    t.text     "description_of_class"
    t.string   "brand_label_file_file_name"
    t.string   "brand_label_file_content_type"
    t.integer  "brand_label_file_file_size"
    t.datetime "brand_label_file_updated_at"
    t.string   "digital_signature_file_name"
    t.string   "digital_signature_content_type"
    t.integer  "digital_signature_file_size"
    t.datetime "digital_signature_updated_at"
    t.integer  "type_of_paten_id"
    t.integer  "criteria_request_id"
    t.string   "invention_title"
    t.text     "abstract"
    t.integer  "total_claim"
    t.integer  "total_page"
    t.string   "paten_description_file_file_name"
    t.string   "paten_description_file_content_type"
    t.integer  "paten_description_file_file_size"
    t.datetime "paten_description_file_updated_at"
    t.string   "image_pdf_file_name"
    t.string   "image_pdf_content_type"
    t.integer  "image_pdf_file_size"
    t.datetime "image_pdf_updated_at"
    t.string   "publication_image_file_name"
    t.string   "publication_image_content_type"
    t.integer  "publication_image_file_size"
    t.datetime "publication_image_updated_at"
    t.string   "certificate_file_name"
    t.string   "certificate_content_type"
    t.integer  "certificate_file_size"
    t.datetime "certificate_updated_at"
  end

  create_table "curriculum_items", :force => true do |t|
    t.integer  "curriculum_id"
    t.integer  "number_id"
    t.integer  "semester_id"
    t.string   "code"
    t.string   "title"
    t.integer  "sks"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "closed_id",            :default => 0
    t.integer  "subject_id"
    t.float    "total_point",          :default => 0.0
    t.integer  "evaluation_status_id", :default => 0
  end

  create_table "curriculums", :force => true do |t|
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "program_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "feeder_id"
  end

  create_table "degree_salaries", :force => true do |t|
    t.string   "name"
    t.integer  "salary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "documents", :force => true do |t|
    t.integer  "type_id",               :default => 0
    t.integer  "owner_id",              :default => 0
    t.string   "number"
    t.date     "dated_at"
    t.string   "description"
    t.integer  "status_id",             :default => 1
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "title"
    t.integer  "position_id",           :default => 0
  end

  create_table "electronic_letters", :force => true do |t|
    t.date     "letter_date"
    t.string   "letter_number"
    t.text     "for"
    t.string   "sha_id"
    t.string   "subject"
    t.integer  "administrator_id"
    t.string   "by"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.integer  "administrator_signature_authorizer_id"
    t.integer  "status_id",                             :default => 0
    t.text     "administrator_authorizer_note"
  end

  create_table "employees", :force => true do |t|
    t.string   "name",                          :default => ""
    t.string   "front_title",                   :default => ""
    t.string   "back_title",                    :default => ""
    t.string   "place_of_birth"
    t.date     "date_of_birth"
    t.integer  "sex_id",                        :default => 0
    t.integer  "religion_id",                   :default => 0
    t.integer  "blood_id",                      :default => 0
    t.string   "handphone"
    t.string   "email"
    t.string   "identity_address1"
    t.string   "identity_address2"
    t.string   "identity_address3"
    t.string   "identity_address4"
    t.string   "identity_address5"
    t.string   "identity_address6"
    t.string   "residence_address1"
    t.string   "residence_address2"
    t.string   "residence_address3"
    t.string   "residence_address4"
    t.string   "residence_address5"
    t.string   "residence_address6"
    t.string   "mother_name"
    t.integer  "marriage_id",                   :default => 0
    t.integer  "number_of_dependents",          :default => 0
    t.string   "identity_code"
    t.string   "tax_code"
    t.string   "healthcare_code"
    t.string   "employment_code"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "basic_salary_id"
    t.integer  "degree_salary_id"
    t.integer  "functional_position_salary_id"
    t.integer  "special_salary",                :default => 0
    t.string   "salary_note"
    t.date     "since"
  end

  create_table "evaluation_cards", :force => true do |t|
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "program_id"
    t.integer  "lecturer_id"
    t.decimal  "index_score",   :precision => 5, :scale => 2, :default => 0.0
    t.decimal  "average_score", :precision => 5, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "exam_questions", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "position_id",                 :default => 0
    t.integer  "value_id",                    :default => 0
    t.text     "question"
    t.string   "question_image_file_name"
    t.string   "question_image_content_type"
    t.integer  "question_image_file_size"
    t.datetime "question_image_updated_at"
    t.text     "answer"
    t.string   "answer_image_file_name"
    t.string   "answer_image_content_type"
    t.integer  "answer_image_file_size"
    t.datetime "answer_image_updated_at"
    t.integer  "enabled_id",                  :default => 1
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "exams", :force => true do |t|
    t.integer  "lecture_schedule_item_id"
    t.string   "trait"
    t.integer  "category_id"
    t.integer  "model_id"
    t.integer  "enabled_id",               :default => 1
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "faculties", :force => true do |t|
    t.string   "title"
    t.string   "license"
    t.string   "abbreviation"
    t.text     "vision"
    t.text     "mission"
    t.string   "code"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.text     "purpose"
    t.integer  "dean_id"
    t.integer  "vice_dean_1_id"
    t.integer  "vice_dean_2_id"
    t.integer  "vice_dean_3_id"
    t.string   "organization_file_name"
    t.string   "organization_content_type"
    t.integer  "organization_file_size"
    t.datetime "organization_updated_at"
    t.string   "title_in_english"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "quality_assurance_unit_id"
    t.text     "target"
    t.string   "faculty_title"
    t.string   "dean_title"
    t.string   "vice_dean_1_title"
    t.string   "vice_dean_2_title"
    t.string   "vice_dean_3_title"
    t.string   "license_number"
    t.date     "license_date"
    t.string   "dean_decree_number"
    t.date     "dean_decree_date"
    t.date     "dean_decree_until"
    t.string   "letter_code"
    t.string   "faculty_title_in_english"
    t.string   "dean_title_in_english"
    t.string   "vice_dean_1_title_in_english"
    t.string   "vice_dean_2_title_in_english"
    t.string   "vice_dean_3_title_in_english"
    t.string   "quality_assurance_unit_title"
    t.string   "quality_assurance_unit_title_in_english"
    t.string   "letterhead_file_name"
    t.string   "letterhead_content_type"
    t.integer  "letterhead_file_size"
    t.datetime "letterhead_updated_at"
    t.text     "vision_in_english",                       :default => "Missing Translate"
    t.text     "mission_in_english",                      :default => "Missing Translate"
    t.text     "purpose_in_english",                      :default => "Missing Translate"
    t.text     "target_in_english",                       :default => "Missing Translate"
  end

  create_table "faculty_documents", :force => true do |t|
    t.integer  "faculty_id"
    t.integer  "position_id",           :default => 0
    t.string   "number"
    t.date     "made_on"
    t.integer  "type_id",               :default => 0
    t.integer  "status_id",             :default => 1
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.text     "note"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "feeder_institutions", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.string   "short_title"
    t.string   "feeder_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "feeder_programs", :force => true do |t|
    t.integer  "feeder_institution_id"
    t.string   "title"
    t.string   "code"
    t.string   "feeder_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "degree_id",             :default => 0
  end

  create_table "feeder_schedule_lecturers", :force => true do |t|
    t.integer  "feeder_schedule_id"
    t.integer  "lecturer_id"
    t.integer  "sks",                       :default => 0
    t.integer  "expected_attendance_count", :default => 0
    t.integer  "attendance_count",          :default => 0
    t.integer  "status_id",                 :default => 1
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "synchronize_description"
  end

  create_table "feeder_schedule_students", :force => true do |t|
    t.integer  "feeder_schedule_id"
    t.integer  "student_id"
    t.integer  "status_id",               :default => 1
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "synchronize_description"
  end

  create_table "feeder_schedules", :force => true do |t|
    t.integer  "position_id",             :default => 0
    t.integer  "program_id"
    t.integer  "year_id"
    t.integer  "stage_id"
    t.string   "class_name"
    t.integer  "curriculum_item_id"
    t.integer  "semester_id",             :default => 0
    t.integer  "status_id",               :default => 1
    t.integer  "students_count",          :default => 0
    t.integer  "lecturers_count",         :default => 0
    t.text     "note"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "feeder_id"
    t.string   "synchronize_description"
  end

  create_table "final_term_documents", :force => true do |t|
    t.integer  "final_term_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "final_terms", :force => true do |t|
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "program_id"
    t.date     "date_at"
    t.integer  "lecture_schedule_item_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "closed_id",                :default => 0
  end

  create_table "functional_position_salaries", :force => true do |t|
    t.string   "name"
    t.integer  "salary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "general_post_images", :force => true do |t|
    t.integer  "general_post_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "general_posts", :force => true do |t|
    t.integer  "general_id"
    t.string   "title"
    t.text     "content"
    t.integer  "publish_id",      :default => 0
    t.integer  "number_of_click", :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "in_letters", :force => true do |t|
    t.string   "sender"
    t.string   "number"
    t.text     "about"
    t.text     "summary"
    t.integer  "faculty_id"
    t.integer  "program_id",            :default => 0
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "indonesia_postal_codes", :force => true do |t|
    t.string   "postal_code"
    t.string   "sub_dictrict"
    t.string   "district"
    t.string   "city"
    t.string   "province"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.string   "contact_name",  :default => ""
    t.string   "contact_phone", :default => ""
    t.string   "address",       :default => ""
    t.integer  "status_id",     :default => 1
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "intensive_test_items", :force => true do |t|
    t.integer  "intensive_test_id"
    t.integer  "study_card_item_id"
    t.integer  "intensive_score"
    t.datetime "tested_at"
    t.integer  "duration"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "intensive_tests", :force => true do |t|
    t.integer  "study_card_id"
    t.integer  "payment_id"
    t.integer  "status_id",     :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "lecture_schedule_item_feeder_teams", :force => true do |t|
    t.integer  "lecture_schedule_item_id"
    t.integer  "position_id",              :default => 0
    t.integer  "lecturer_id"
    t.integer  "sks"
    t.integer  "target_attendance"
    t.integer  "realization_attendance"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "lecture_schedule_item_teams", :force => true do |t|
    t.integer  "lecture_schedule_item_id"
    t.integer  "position_id",              :default => 0
    t.integer  "lecturer_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "lecture_schedule_items", :force => true do |t|
    t.integer  "number_id"
    t.integer  "curriculum_item_id"
    t.integer  "lecturer_id"
    t.integer  "day_of_classes"
    t.integer  "class_room_id"
    t.integer  "start_hour"
    t.integer  "start_minute"
    t.integer  "end_hour"
    t.integer  "end_minute"
    t.text     "note"
    t.integer  "lecture_schedule_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "exclude_id",              :default => 0
    t.integer  "closed_id",               :default => 0
    t.integer  "status_id",               :default => 0
    t.date     "middle_term_date_at"
    t.date     "final_term_date_at"
    t.date     "remedial_term_date_at"
    t.date     "block_term_date_at"
    t.integer  "locked_middle_id",        :default => 0
    t.integer  "locked_final_id",         :default => 0
    t.integer  "feeder_year_id",          :default => 0
    t.integer  "feeder_stage_id",         :default => 0
    t.string   "feeder_id"
    t.string   "synchronize_description"
    t.string   "sha_id"
    t.string   "report_file_name"
    t.string   "report_content_type"
    t.integer  "report_file_size"
    t.datetime "report_updated_at"
  end

  create_table "lecture_schedules", :force => true do |t|
    t.string   "class_name"
    t.integer  "semester_id"
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "program_id"
    t.text     "note"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "number_id",        :default => 0
    t.integer  "maximum_students", :default => 0
    t.integer  "prefect_id"
    t.integer  "secretary_id"
    t.integer  "treasurer_id"
    t.integer  "closed_id",        :default => 0
  end

  create_table "lecturer_decrees", :force => true do |t|
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "faculty_id"
    t.integer  "lecturer_id"
    t.string   "code"
    t.date     "printed_at"
    t.date     "started_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lecturer_degrees", :force => true do |t|
    t.integer  "lecturer_id"
    t.integer  "degree_id",       :default => 0
    t.string   "title"
    t.string   "program"
    t.string   "university"
    t.date     "graduation_date"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "lecturer_documents", :force => true do |t|
    t.integer  "lecturer_id"
    t.integer  "position_id",        :default => 0
    t.integer  "document_id",        :default => 0
    t.string   "issued_by"
    t.string   "number"
    t.date     "date_at"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "lecturer_post_documents", :force => true do |t|
    t.integer  "lecturer_post_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "lecturer_post_images", :force => true do |t|
    t.integer  "lecturer_post_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "lecturer_posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "published_id", :default => 0
    t.integer  "clicked_id",   :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "lecturers", :force => true do |t|
    t.string   "code",                                                    :default => ""
    t.string   "name",                                                    :default => ""
    t.string   "place_of_birth"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "handphone"
    t.string   "phone"
    t.integer  "rank_id",                                                 :default => 1
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
    t.string   "short_name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "religion_id",                                             :default => 1
    t.decimal  "salary",                   :precision => 14, :scale => 2, :default => 0.0
    t.integer  "status_id",                                               :default => 1
    t.string   "tax_code"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "current_year_id",                                         :default => 2016
    t.integer  "current_stage_id",                                        :default => 1
    t.integer  "current_program_id",                                      :default => 1
    t.integer  "publication_id",                                          :default => 0
    t.integer  "sinta_id",                                                :default => 0
    t.string   "person_feeder_id"
    t.string   "feeder_id"
    t.string   "program_feeder_id"
    t.integer  "grade_id",                                                :default => 0
    t.integer  "visible_id",                                              :default => 1
    t.string   "front_title"
    t.string   "rear_title"
    t.integer  "sex_id",                                                  :default => 0
    t.string   "indonesia_postal_code_id"
    t.string   "nasionality"
  end

  create_table "lend_items", :force => true do |t|
    t.integer  "lend_id"
    t.integer  "bookcopy_id"
    t.integer  "status_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lends", :force => true do |t|
    t.integer  "student_id"
    t.integer  "lecturer_id"
    t.date     "date_of_apply_lend"
    t.date     "date_of_apply_return"
    t.date     "date_of_lend"
    t.date     "date_of_return"
    t.integer  "lend_administrator_id",   :default => 0
    t.integer  "return_administrator_id"
    t.integer  "status_id"
    t.string   "note"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "library_book_copies", :force => true do |t|
    t.integer  "status_id"
    t.integer  "library_book_id"
    t.integer  "location_id"
    t.date     "date_of_entry"
    t.date     "date_of_expired"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "library_books", :force => true do |t|
    t.string   "old_id"
    t.integer  "year"
    t.integer  "kind_of_collection_id"
    t.integer  "category_book_id"
    t.integer  "language_id"
    t.string   "title"
    t.string   "author"
    t.string   "publisher_id"
    t.string   "physical_desc"
    t.string   "isbn_issn"
    t.string   "subject"
    t.string   "note"
    t.integer  "number_of_copy"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "linktree_items", :force => true do |t|
    t.integer  "position_id"
    t.integer  "linktree_id"
    t.string   "name"
    t.string   "link"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "linktrees", :force => true do |t|
    t.string   "name"
    t.boolean  "main",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "subtitle"
  end

  create_table "middle_terms", :force => true do |t|
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "program_id"
    t.date     "date_at"
    t.integer  "lecture_schedule_item_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "closed_id",                :default => 0
  end

  create_table "offices", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "organization_id"
    t.string   "employment_number"
    t.date     "employment_at"
    t.string   "unemployment_number"
    t.date     "unemployment_at"
    t.integer  "branch_id"
    t.integer  "status_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "parent_id",   :default => 0
    t.integer  "leaf_id",     :default => 0
    t.integer  "position_id", :default => 0
    t.string   "parent_list"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "salary"
  end

  create_table "out_letters", :force => true do |t|
    t.string   "receiver"
    t.string   "number"
    t.text     "about"
    t.text     "summary"
    t.integer  "faculty_id"
    t.integer  "program_id",            :default => 0
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "page_images", :force => true do |t|
    t.integer  "page_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "id_title"
    t.text     "id_head"
    t.text     "id_heading"
    t.text     "id_content"
    t.text     "id_body"
    t.string   "en_title"
    t.text     "en_head"
    t.text     "en_heading"
    t.text     "en_content"
    t.text     "en_body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payment_items", :force => true do |t|
    t.integer  "position"
    t.integer  "payment_id"
    t.integer  "type_of_payment_id"
    t.integer  "installment_id"
    t.decimal  "amount",             :precision => 14, :scale => 2, :default => 0.0
    t.integer  "method_id"
    t.string   "note"
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
    t.integer  "hidden_id",                                         :default => 0
  end

  create_table "payment_receipt_histories", :force => true do |t|
    t.integer  "payment_id"
    t.integer  "method_id"
    t.string   "method_description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "student_id"
    t.integer  "administrator_id"
    t.string   "student_code"
    t.integer  "program_id"
    t.decimal  "amount",           :precision => 14, :scale => 2, :default => 0.0
    t.text     "note"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "year_id"
    t.integer  "location_id",                                     :default => 0
    t.string   "sha_id"
  end

  create_table "payroll_histories", :force => true do |t|
    t.string   "year"
    t.string   "month"
    t.string   "employee_id"
    t.string   "position_name"
    t.integer  "basic_salary"
    t.integer  "structural_salary"
    t.integer  "degree_salary"
    t.integer  "functional_position_salary"
    t.integer  "periodic_salary"
    t.integer  "special_salary"
    t.boolean  "status",                     :default => true
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "permanent_lecturers", :force => true do |t|
    t.integer  "lecturer_id"
    t.integer  "program_id"
    t.string   "employment_number"
    t.date     "employment_at"
    t.string   "unemployment_number"
    t.date     "unemployment_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "status_id",           :default => 1
    t.integer  "position_id",         :default => 0
  end

  create_table "post_images", :force => true do |t|
    t.integer  "post_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "status",           :default => 0
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "front",            :default => 0
    t.integer  "publish",          :default => 1
    t.string   "subtitle"
    t.integer  "number_of_click",  :default => 0
    t.integer  "administrator_id", :default => 1
  end

  create_table "potential_answers", :force => true do |t|
    t.integer  "potential_test_id"
    t.integer  "potential_question_id"
    t.integer  "number_id"
    t.integer  "answer_id"
    t.integer  "correct_id",            :default => 0
    t.integer  "score_id",              :default => 0
    t.integer  "doubt_id",              :default => 0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "potential_questions", :force => true do |t|
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.text     "question"
    t.text     "choice_1"
    t.text     "choice_2"
    t.text     "choice_3"
    t.text     "choice_4"
    t.integer  "answer"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "potential_tests", :force => true do |t|
    t.integer  "student_id"
    t.string   "code"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "problem_boxes", :force => true do |t|
    t.string   "name"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
  end

  create_table "problem_discussions", :force => true do |t|
    t.integer  "problem_id"
    t.text     "content"
    t.integer  "administrator_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.datetime "administrator_read_at"
    t.datetime "known_by_read_at"
    t.datetime "taken_by_read_at"
  end

  create_table "problem_images", :force => true do |t|
    t.integer  "problem_id"
    t.integer  "administrator_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "problems", :force => true do |t|
    t.integer  "status_id",        :default => 0
    t.text     "description"
    t.integer  "administrator_id"
    t.integer  "known_by_id"
    t.integer  "taken_by_id"
    t.integer  "problem_box_id"
    t.datetime "submit_at"
    t.datetime "submitted_at"
    t.datetime "process_at"
    t.datetime "close_at"
    t.datetime "closed_at"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "program_documents", :force => true do |t|
    t.integer  "program_id"
    t.integer  "position_id",           :default => 0
    t.string   "number"
    t.date     "made_on"
    t.integer  "type_id",               :default => 0
    t.integer  "status_id",             :default => 1
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.text     "note"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "program_report_logs", :force => true do |t|
    t.integer  "program_report_id"
    t.integer  "status_id"
    t.text     "note"
    t.integer  "administrator_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "program_reports", :force => true do |t|
    t.integer  "program_id"
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "status_id",                                                             :default => 0
    t.integer  "compiled_id",                                                           :default => 0
    t.integer  "students_size",                                                         :default => 0
    t.integer  "study_cards_active_size",                                               :default => 0
    t.integer  "study_cards_non_active_size",                                           :default => 0
    t.integer  "study_cards_leave_size",                                                :default => 0
    t.integer  "study_cards_pending_size",                                              :default => 0
    t.integer  "lecture_schedule_items_size",                                           :default => 0
    t.integer  "lecture_schedule_items_pending_size",                                   :default => 0
    t.decimal  "study_cards_ips_average",                :precision => 14, :scale => 2, :default => 0.0
    t.decimal  "study_cards_ips_maximum",                :precision => 14, :scale => 2, :default => 0.0
    t.decimal  "study_cards_ips_minimum",                :precision => 14, :scale => 2, :default => 0.0
    t.integer  "study_cards_ips_below_standart_size",                                   :default => 0
    t.integer  "study_cards_ips_equal_to_zero_size",                                    :default => 0
    t.integer  "study_cards_sks_above_standart_size",                                   :default => 0
    t.integer  "lecturers_sks_above_standart_size",                                     :default => 0
    t.datetime "created_at",                                                                             :null => false
    t.datetime "updated_at",                                                                             :null => false
    t.integer  "new_students_size",                                                     :default => 0
    t.integer  "unregistered_students_size",                                            :default => 0
    t.integer  "active_students_size",                                                  :default => 0
    t.integer  "active_student_without_study_card_size",                                :default => 0
    t.integer  "unfinished_remedial_size",                                              :default => 0
    t.integer  "unfinished_intensive_size",                                             :default => 0
    t.integer  "feeder_lecturer_percentage",                                            :default => 0
  end

  create_table "programs", :force => true do |t|
    t.string   "title"
    t.string   "license"
    t.string   "abbreviation"
    t.text     "vision"
    t.text     "mission"
    t.integer  "faculty_id"
    t.string   "code"
    t.string   "levels_of_education"
    t.string   "graduation_title"
    t.datetime "created_at",                                                                                                  :null => false
    t.datetime "updated_at",                                                                                                  :null => false
    t.text     "purpose"
    t.integer  "head_id"
    t.integer  "secretary_id"
    t.datetime "start_print_study_card"
    t.datetime "end_print_study_card"
    t.datetime "start_print_middle_card"
    t.datetime "end_print_middle_card"
    t.datetime "start_print_final_card"
    t.datetime "end_print_final_card"
    t.string   "epsbed_level"
    t.string   "epsbed_code"
    t.string   "accreditation_number"
    t.integer  "accreditation_year"
    t.string   "accreditation_level"
    t.date     "accreditation_expiration_date"
    t.string   "accreditation_status"
    t.integer  "position_id",                                                                :default => 0
    t.string   "feeder_id"
    t.string   "accreditation_information_status"
    t.string   "accreditation_information_status_in_english"
    t.string   "title_information"
    t.string   "title_information_in_english"
    t.string   "license_information"
    t.string   "license_information_in_english"
    t.string   "degree_program"
    t.string   "degree_program_in_english"
    t.string   "person_title"
    t.string   "person_title_in_english"
    t.integer  "quality_control_group_id"
    t.text     "target"
    t.integer  "minimal_sks",                                                                :default => 0
    t.integer  "maximal_sks",                                                                :default => 0
    t.integer  "current_year_id"
    t.integer  "current_stage_id"
    t.integer  "create_study_card_id"
    t.integer  "submit_study_card_id"
    t.date     "license_date"
    t.date     "accreditation_date"
    t.string   "letter_code"
    t.datetime "start_remedial_submission"
    t.datetime "end_remedial_submission"
    t.integer  "current_remedial_year_id"
    t.integer  "current_remedial_stage_id"
    t.text     "short_profile"
    t.text     "graduate_profile"
    t.text     "graduate_competence"
    t.datetime "start_intensive_submission"
    t.datetime "end_intensive_submission"
    t.integer  "current_intensive_year_id"
    t.integer  "current_intensive_stage_id"
    t.decimal  "minimal_ipk",                                 :precision => 14, :scale => 2, :default => 0.0
    t.integer  "accreditation_score",                                                        :default => 0
    t.text     "vision_in_english",                                                          :default => "Missing Translate"
    t.text     "mission_in_english",                                                         :default => "Missing Translate"
    t.text     "purpose_in_english",                                                         :default => "Missing Translate"
    t.text     "target_in_english",                                                          :default => "Missing Translate"
    t.integer  "registration_year_id",                                                       :default => 0
    t.integer  "registration_stage_id",                                                      :default => 0
    t.integer  "status_id",                                                                  :default => 1
  end

  create_table "questionnaires", :force => true do |t|
    t.string   "title"
    t.text     "instruction"
    t.string   "revision"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "questionnaire_id"
    t.integer  "group_id"
    t.integer  "number_id"
    t.integer  "competence_id"
    t.string   "assesment"
    t.string   "score_0"
    t.string   "score_1"
    t.string   "score_2"
    t.string   "score_3"
    t.string   "score_4"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "register_discounts", :force => true do |t|
    t.integer  "register_id"
    t.integer  "term_of_payment_item_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.decimal  "discount"
  end

  create_table "register_logs", :force => true do |t|
    t.integer  "status_id"
    t.text     "note"
    t.integer  "administrator_id"
    t.integer  "register_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "register_promos", :force => true do |t|
    t.string   "name_of_promotion"
    t.string   "promo_code"
    t.date     "starting_date"
    t.date     "ending_date"
    t.text     "term_and_condition"
    t.decimal  "maximum_amount"
    t.integer  "promo_percentage"
    t.string   "banner_image_file_name"
    t.string   "banner_image_content_type"
    t.integer  "banner_image_file_size"
    t.datetime "banner_image_updated_at"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.boolean  "need_optional_document",    :default => false
  end

  create_table "registers", :force => true do |t|
    t.integer  "student_id"
    t.integer  "status_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "size_of_almamater_id"
    t.decimal  "fix_nominal_one"
    t.decimal  "fix_nominal_two"
    t.text     "administrator_note_one"
    t.text     "administrator_note_two"
    t.string   "promo_code"
    t.string   "optional_document_file_name"
    t.string   "optional_document_content_type"
    t.integer  "optional_document_file_size"
    t.datetime "optional_document_updated_at"
  end

  create_table "remedial_terms", :force => true do |t|
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "program_id"
    t.date     "date_at"
    t.integer  "lecture_schedule_item_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "closed_id",                :default => 0
  end

  create_table "remedial_test_items", :force => true do |t|
    t.integer  "remedial_test_id"
    t.integer  "study_card_item_id"
    t.integer  "remedial_score"
    t.datetime "tested_at"
    t.integer  "duration"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "remedial_tests", :force => true do |t|
    t.integer  "study_card_id"
    t.integer  "payment_id"
    t.integer  "status_id",     :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "request_enrolment_statement_logs", :force => true do |t|
    t.integer  "request_enrolment_statement_id"
    t.integer  "status_id"
    t.text     "note"
    t.integer  "student_id"
    t.integer  "administrator_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "request_enrolment_statements", :force => true do |t|
    t.integer  "student_id"
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "program_id"
    t.integer  "status_id",                :default => 0
    t.string   "purpose"
    t.integer  "responsible_id",           :default => 0
    t.string   "resident_card_id"
    t.string   "occupation"
    t.string   "office_name"
    t.string   "office_address"
    t.string   "address"
    t.string   "sha_id"
    t.string   "letter_number"
    t.string   "certificate_file_name"
    t.string   "certificate_content_type"
    t.integer  "certificate_file_size"
    t.datetime "certificate_updated_at"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "research_dissemination_images", :force => true do |t|
    t.integer  "research_dissemination_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "note"
    t.integer  "status_id",                 :default => 0
    t.integer  "position_id",               :default => 0
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "research_dissemination_logs", :force => true do |t|
    t.integer  "research_dissemination_id"
    t.integer  "status_id"
    t.text     "note"
    t.integer  "student_id"
    t.integer  "lecturer_id"
    t.integer  "administrator_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "research_dissemination_members", :force => true do |t|
    t.integer  "position_id",               :default => 0
    t.integer  "research_dissemination_id"
    t.integer  "student_id"
    t.integer  "status_id",                 :default => 0
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "research_dissemination_participants", :force => true do |t|
    t.integer  "research_dissemination_id"
    t.integer  "status_id",                 :default => 0
    t.integer  "student_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "research_disseminations", :force => true do |t|
    t.integer  "lecturer_id"
    t.integer  "student_id"
    t.integer  "status_id",                   :default => 0
    t.string   "title"
    t.text     "abstract"
    t.string   "keywords"
    t.integer  "publisher_id",                :default => 0
    t.string   "publisher_url"
    t.string   "publisher_name"
    t.string   "publisher_number"
    t.string   "conference_location"
    t.date     "conference_start_date"
    t.date     "conference_end_date"
    t.integer  "journal_year"
    t.integer  "journal_volume"
    t.integer  "journal_number"
    t.string   "article_url"
    t.string   "letter_number"
    t.integer  "class_room_id"
    t.integer  "participant_size",            :default => 0
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "article_file_name"
    t.string   "article_content_type"
    t.integer  "article_file_size"
    t.datetime "article_updated_at"
    t.string   "administration_file_name"
    t.string   "administration_content_type"
    t.integer  "administration_file_size"
    t.datetime "administration_updated_at"
    t.text     "minutes"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "presentation_file_name"
    t.string   "presentation_content_type"
    t.integer  "presentation_file_size"
    t.datetime "presentation_updated_at"
    t.integer  "journal_grade_id",            :default => 0
    t.integer  "conference_grade_id",         :default => 0
    t.string   "decree_file_name"
    t.string   "decree_content_type"
    t.integer  "decree_file_size"
    t.datetime "decree_updated_at"
    t.string   "sha_id"
  end

  create_table "research_proposal_logs", :force => true do |t|
    t.integer  "research_proposal_id"
    t.integer  "status_id"
    t.text     "note"
    t.integer  "student_id"
    t.integer  "lecturer_id"
    t.integer  "administrator_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "research_proposal_members", :force => true do |t|
    t.integer  "position_id",          :default => 0
    t.integer  "research_proposal_id"
    t.integer  "student_id"
    t.integer  "status_id",            :default => 0
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "research_proposal_reviews", :force => true do |t|
    t.integer  "research_proposal_id"
    t.integer  "status_id",                       :default => 0
    t.integer  "lecturer_id"
    t.integer  "administrator_id"
    t.integer  "originality_id"
    t.integer  "significance_of_topic_id"
    t.integer  "presentation_id"
    t.integer  "familiarity_id"
    t.integer  "recommendation_id"
    t.text     "strength_weakness_note"
    t.text     "contributions_and_comments_note"
    t.text     "additional_note"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "research_proposals", :force => true do |t|
    t.integer  "lecturer_id"
    t.integer  "student_id"
    t.integer  "status_id",                :default => 0
    t.string   "title"
    t.string   "roadmap_file_name"
    t.string   "roadmap_content_type"
    t.integer  "roadmap_file_size"
    t.datetime "roadmap_updated_at"
    t.string   "chapter_one_file_name"
    t.string   "chapter_one_content_type"
    t.integer  "chapter_one_file_size"
    t.datetime "chapter_one_updated_at"
    t.integer  "chapter_one_page_count",   :default => 0
    t.string   "chapter_two_file_name"
    t.string   "chapter_two_content_type"
    t.integer  "chapter_two_file_size"
    t.datetime "chapter_two_updated_at"
    t.integer  "chapter_two_page_count",   :default => 0
    t.string   "letter_number"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "decree_file_name"
    t.string   "decree_content_type"
    t.integer  "decree_file_size"
    t.datetime "decree_updated_at"
    t.string   "sha_id"
  end

  create_table "research_publication_logs", :force => true do |t|
    t.integer  "research_publication_id"
    t.integer  "status_id"
    t.text     "note"
    t.integer  "student_id"
    t.integer  "lecturer_id"
    t.integer  "administrator_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "research_publication_members", :force => true do |t|
    t.integer  "position_id",             :default => 0
    t.integer  "research_publication_id"
    t.integer  "student_id"
    t.integer  "status_id",               :default => 0
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "research_publication_similarities", :force => true do |t|
    t.integer  "research_publication_id"
    t.integer  "administrator_id"
    t.integer  "status_id",                      :default => 0
    t.integer  "similarity_percentage_id",       :default => 0
    t.integer  "payment_id"
    t.string   "similarity_report_file_name"
    t.string   "similarity_report_content_type"
    t.integer  "similarity_report_file_size"
    t.datetime "similarity_report_updated_at"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "research_publications", :force => true do |t|
    t.integer  "lecturer_id"
    t.integer  "student_id"
    t.integer  "status_id",                         :default => 0
    t.string   "title"
    t.integer  "publisher_id",                      :default => 0
    t.string   "publisher_url"
    t.string   "publisher_name"
    t.string   "publisher_number"
    t.string   "conference_location"
    t.date     "conference_start_date"
    t.date     "conference_end_date"
    t.integer  "journal_year"
    t.integer  "journal_volume"
    t.integer  "journal_number"
    t.string   "letter_number"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.string   "template_file_name"
    t.string   "template_content_type"
    t.integer  "template_file_size"
    t.datetime "template_updated_at"
    t.string   "manuscript_file_name"
    t.string   "manuscript_content_type"
    t.integer  "manuscript_file_size"
    t.datetime "manuscript_updated_at"
    t.string   "letter_of_acceptance_file_name"
    t.string   "letter_of_acceptance_content_type"
    t.integer  "letter_of_acceptance_file_size"
    t.datetime "letter_of_acceptance_updated_at"
    t.string   "reviews_result_file_name"
    t.string   "reviews_result_content_type"
    t.integer  "reviews_result_file_size"
    t.datetime "reviews_result_updated_at"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "journal_grade_id",                  :default => 0
    t.integer  "conference_grade_id",               :default => 0
    t.string   "decree_file_name"
    t.string   "decree_content_type"
    t.integer  "decree_file_size"
    t.datetime "decree_updated_at"
    t.string   "sha_id"
  end

  create_table "research_report_logs", :force => true do |t|
    t.integer  "research_report_id"
    t.integer  "status_id"
    t.text     "note"
    t.integer  "student_id"
    t.integer  "lecturer_id"
    t.integer  "administrator_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "research_report_members", :force => true do |t|
    t.integer  "position_id",        :default => 0
    t.integer  "research_report_id"
    t.integer  "student_id"
    t.integer  "status_id",          :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "research_report_reviews", :force => true do |t|
    t.integer  "research_report_id"
    t.integer  "status_id",                       :default => 0
    t.integer  "lecturer_id"
    t.integer  "administrator_id"
    t.integer  "originality_id"
    t.integer  "significance_of_topic_id"
    t.integer  "presentation_id"
    t.integer  "familiarity_id"
    t.integer  "recommendation_id"
    t.text     "strength_weakness_note"
    t.text     "contributions_and_comments_note"
    t.text     "additional_note"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "research_report_similarities", :force => true do |t|
    t.integer  "research_report_id"
    t.integer  "administrator_id"
    t.integer  "status_id",                      :default => 0
    t.integer  "similarity_percentage_id",       :default => 0
    t.integer  "payment_id"
    t.string   "similarity_report_file_name"
    t.string   "similarity_report_content_type"
    t.integer  "similarity_report_file_size"
    t.datetime "similarity_report_updated_at"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "research_reports", :force => true do |t|
    t.integer  "lecturer_id"
    t.integer  "student_id"
    t.integer  "status_id",                      :default => 0
    t.string   "title"
    t.string   "statement_sheet_file_name"
    t.string   "statement_sheet_content_type"
    t.integer  "statement_sheet_file_size"
    t.datetime "statement_sheet_updated_at"
    t.string   "abstract_file_name"
    t.string   "abstract_content_type"
    t.integer  "abstract_file_size"
    t.datetime "abstract_updated_at"
    t.string   "foreword_file_name"
    t.string   "foreword_content_type"
    t.integer  "foreword_file_size"
    t.datetime "foreword_updated_at"
    t.string   "table_of_contents_file_name"
    t.string   "table_of_contents_content_type"
    t.integer  "table_of_contents_file_size"
    t.datetime "table_of_contents_updated_at"
    t.string   "chapter_one_file_name"
    t.string   "chapter_one_content_type"
    t.integer  "chapter_one_file_size"
    t.datetime "chapter_one_updated_at"
    t.integer  "chapter_one_page_count",         :default => 0
    t.string   "chapter_two_file_name"
    t.string   "chapter_two_content_type"
    t.integer  "chapter_two_file_size"
    t.datetime "chapter_two_updated_at"
    t.integer  "chapter_two_page_count",         :default => 0
    t.string   "chapter_three_file_name"
    t.string   "chapter_three_content_type"
    t.integer  "chapter_three_file_size"
    t.datetime "chapter_three_updated_at"
    t.integer  "chapter_three_page_count",       :default => 0
    t.string   "chapter_four_file_name"
    t.string   "chapter_four_content_type"
    t.integer  "chapter_four_file_size"
    t.datetime "chapter_four_updated_at"
    t.integer  "chapter_four_page_count",        :default => 0
    t.string   "bibliography_file_name"
    t.string   "bibliography_content_type"
    t.integer  "bibliography_file_size"
    t.datetime "bibliography_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "appendix_file_name"
    t.string   "appendix_content_type"
    t.integer  "appendix_file_size"
    t.datetime "appendix_updated_at"
    t.string   "letter_number"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "decree_file_name"
    t.string   "decree_content_type"
    t.integer  "decree_file_size"
    t.datetime "decree_updated_at"
    t.string   "sha_id"
    t.string   "manuscript_file_name"
    t.string   "manuscript_content_type"
    t.integer  "manuscript_file_size"
    t.datetime "manuscript_updated_at"
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

  create_table "search_students", :force => true do |t|
    t.string   "code_from"
    t.string   "code_to"
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "handphone"
    t.string   "phone"
    t.string   "father_name"
    t.string   "mother_name"
    t.integer  "blood_id"
    t.integer  "religion_id"
    t.integer  "limit_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "program_id"
    t.string   "place_of_birth"
    t.integer  "scholarship_id"
    t.integer  "sex_id"
    t.integer  "status_id"
  end

  create_table "service_comments", :force => true do |t|
    t.integer  "service_id"
    t.text     "description"
    t.integer  "comment_by_id", :default => 1
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "service_histories", :force => true do |t|
    t.integer  "service_id"
    t.text     "description"
    t.integer  "status_id",   :default => 2
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "services", :force => true do |t|
    t.text     "description"
    t.text     "process_description"
    t.integer  "status_id",           :default => 0
    t.datetime "submitted_at"
    t.datetime "processed_at"
    t.integer  "student_id"
    t.integer  "program_id"
    t.integer  "taken_by_id"
    t.integer  "closed_by_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "signature_containers", :force => true do |t|
    t.string   "sha_id"
    t.string   "model_name"
    t.integer  "model_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "signature_containers", ["sha_id"], :name => "index_signature_containers_on_sha_id", :unique => true

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "student_activities", :force => true do |t|
    t.string   "title"
    t.datetime "date_at"
    t.integer  "expected_size"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.integer  "type_id",                        :default => 0
    t.string   "certificate_image_file_name"
    t.string   "certificate_image_content_type"
    t.integer  "certificate_image_file_size"
    t.datetime "certificate_image_updated_at"
    t.integer  "name_x_position",                :default => 0
    t.integer  "name_y_position",                :default => 0
    t.integer  "code_x_position",                :default => 0
    t.integer  "code_y_position",                :default => 0
    t.integer  "name_font_size",                 :default => 24
    t.integer  "code_font_size",                 :default => 10
    t.string   "name_color",                     :default => "000000"
    t.string   "code_color",                     :default => "000000"
  end

  create_table "student_activity_items", :force => true do |t|
    t.integer  "student_activity_id"
    t.integer  "student_id"
    t.string   "code"
    t.datetime "submitted_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "student_exits", :force => true do |t|
    t.integer  "student_id"
    t.integer  "status_id",           :default => 1
    t.integer  "exit_id",             :default => 0
    t.date     "exited_at"
    t.text     "note"
    t.string   "letter_number"
    t.string   "decree_file_name"
    t.string   "decree_content_type"
    t.integer  "decree_file_size"
    t.datetime "decree_updated_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "student_post_documents", :force => true do |t|
    t.integer  "student_post_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "student_post_images", :force => true do |t|
    t.integer  "student_post_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "student_posts", :force => true do |t|
    t.integer  "program_id"
    t.string   "title"
    t.text     "content"
    t.integer  "publish",         :default => 0
    t.integer  "number_of_click", :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "all_program",     :default => 0
  end

  create_table "student_profile_logs", :force => true do |t|
    t.integer  "student_id"
    t.integer  "status_id"
    t.text     "note"
    t.integer  "administrator_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "code",                                                               :default => ""
    t.string   "name",                                                               :default => ""
    t.string   "place_of_birth"
    t.date     "date_of_birth"
    t.integer  "sex_id"
    t.integer  "blood_id"
    t.string   "address"
    t.string   "from_school"
    t.string   "school_majors"
    t.integer  "graduate_year"
    t.decimal  "recent_achievements",                  :precision => 5, :scale => 2, :default => 0.0
    t.integer  "religion_id"
    t.string   "handphone"
    t.string   "phone"
    t.string   "hobby"
    t.integer  "recent_university_id"
    t.string   "recent_university_name"
    t.string   "recent_work"
    t.string   "recent_work_position"
    t.integer  "recent_work_year"
    t.integer  "recent_work_month"
    t.string   "father_name"
    t.string   "father_recent_work"
    t.string   "mother_name"
    t.string   "mother_recent_work"
    t.string   "parent_address"
    t.string   "parent_handphone"
    t.string   "parent_phone"
    t.string   "sibling_who_went_to_same_university"
    t.integer  "program_id"
    t.integer  "selected_class_id"
    t.integer  "source_of_information_id"
    t.string   "other_source_of_information"
    t.string   "recommended_by"
    t.string   "approved_by"
    t.date     "signup_date"
    t.text     "note"
    t.integer  "status_id"
    t.datetime "created_at",                                                                          :null => false
    t.datetime "updated_at",                                                                          :null => false
    t.integer  "completeness_id",                                                    :default => 0
    t.string   "email",                                                              :default => ""
    t.string   "temp_password"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "perishable_token"
    t.integer  "current_year_id",                                                    :default => 0
    t.integer  "current_stage_id",                                                   :default => 0
    t.integer  "current_semester_id",                                                :default => 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "synchronize_id",                                                     :default => 0
    t.integer  "enter_id",                                                           :default => 1
    t.string   "current_class_name"
    t.date     "father_date_of_birth"
    t.date     "mother_date_of_birth"
    t.integer  "father_education_id",                                                :default => 0
    t.integer  "mother_education_id",                                                :default => 0
    t.integer  "father_work_id",                                                     :default => 0
    t.integer  "mother_work_id",                                                     :default => 0
    t.integer  "father_income_id",                                                   :default => 0
    t.integer  "mother_income_id",                                                   :default => 0
    t.string   "guardian_name"
    t.date     "guardian_date_of_birth"
    t.integer  "guardian_education_id",                                              :default => 0
    t.integer  "guardian_work_id",                                                   :default => 0
    t.integer  "guardian_income_id",                                                 :default => 0
    t.string   "resident_card_id"
    t.string   "village"
    t.integer  "stay_id",                                                            :default => 0
    t.string   "rt_id"
    t.string   "rw_id"
    t.string   "postal_code"
    t.string   "ravine"
    t.string   "district"
    t.integer  "country_id",                                                         :default => 0
    t.integer  "institution_id",                                                     :default => 1
    t.string   "healthcare_code"
    t.string   "feeder_id"
    t.integer  "healthcare_id",                                                      :default => 0
    t.string   "person_feeder_id"
    t.integer  "healthcare_room_id",                                                 :default => 3
    t.integer  "required_information_status_id",                                     :default => 0
    t.text     "required_information_description"
    t.integer  "resident_card_type_id",                                              :default => 0
    t.string   "resident_card_image_file_name"
    t.string   "resident_card_image_content_type"
    t.integer  "resident_card_image_file_size"
    t.datetime "resident_card_image_updated_at"
    t.string   "province"
    t.string   "town"
    t.integer  "healthcare_start_month",                                             :default => 0
    t.integer  "healthcare_start_year",                                              :default => 0
    t.integer  "visible_id",                                                         :default => 1
    t.integer  "scholarship_id",                                                     :default => 0
    t.integer  "scholarship_percentage",                                             :default => 0
    t.integer  "scholarship_recommendation_id",                                      :default => 0
    t.string   "scholarship_notes"
    t.date     "healthcare_card_delivered_at"
    t.text     "healthcare_note"
    t.integer  "starting_year_id",                                                   :default => 0
    t.integer  "starting_stage_id",                                                  :default => 0
    t.integer  "feeder_institution_id"
    t.integer  "feeder_program_id"
    t.integer  "recognized_sks"
    t.string   "last_education_document_file_name"
    t.string   "last_education_document_content_type"
    t.integer  "last_education_document_file_size"
    t.datetime "last_education_document_updated_at"
    t.integer  "last_education_id",                                                  :default => 0
    t.integer  "profile_status_id",                                                  :default => 0
    t.integer  "feeder_synchronize_id",                                              :default => 0
    t.string   "nasionality"
    t.string   "tax_card_image_file_name"
    t.string   "tax_card_image_content_type"
    t.integer  "tax_card_image_file_size"
    t.datetime "tax_card_image_updated_at"
    t.integer  "alumni_requirements_id",                                             :default => 0
    t.integer  "lecturer_id"
    t.integer  "classroom_id"
    t.string   "line_messenger_id"
    t.string   "sha_id"
  end

  create_table "study_card_comments", :force => true do |t|
    t.integer  "study_card_id"
    t.text     "content"
    t.integer  "administrator_id", :default => 0
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "study_card_items", :force => true do |t|
    t.integer  "study_card_id"
    t.integer  "number_id",                                              :default => 0
    t.integer  "lecture_schedule_item_id"
    t.integer  "middle_score",                                           :default => 0
    t.integer  "final_score",                                            :default => 0
    t.integer  "task_score",                                             :default => 0
    t.integer  "attendance_score",                                       :default => 0
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
    t.integer  "remedial_score",                                         :default => 0
    t.string   "rh_score"
    t.decimal  "n_score",                  :precision => 5, :scale => 2, :default => 0.0
    t.string   "h_score"
    t.decimal  "a_score",                  :precision => 8, :scale => 2, :default => 0.0
    t.integer  "closed_id",                                              :default => 0
    t.integer  "questionnaire_fill_id",                                  :default => 0
    t.integer  "status_id",                                              :default => 1
    t.integer  "block_1_score",                                          :default => 0
    t.integer  "block_2_score",                                          :default => 0
    t.integer  "block_3_score",                                          :default => 0
    t.integer  "block_4_score",                                          :default => 0
    t.integer  "intensive_score",                                        :default => 0
    t.string   "ih_score"
    t.string   "nh_score"
  end

  create_table "study_cards", :force => true do |t|
    t.integer  "student_id"
    t.integer  "lecturer_id"
    t.integer  "semester_id"
    t.integer  "year_id"
    t.integer  "stage_id"
    t.integer  "program_id"
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
    t.string   "study_card_code"
    t.string   "middle_term_code"
    t.string   "final_term_code"
    t.string   "student_code"
    t.integer  "status_id",                                           :default => 0
    t.integer  "print_study_card_id",                                 :default => 0
    t.integer  "print_middle_card_id",                                :default => 0
    t.integer  "print_final_card_id",                                 :default => 0
    t.decimal  "calculated_ip_score",  :precision => 14, :scale => 2, :default => 0.0
    t.integer  "closed_id",                                           :default => 0
  end

  create_table "subject_assessments", :force => true do |t|
    t.string   "title"
    t.integer  "status_id",  :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "subject_documents", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "type_id"
    t.string   "description"
    t.integer  "status_id",             :default => 1
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "subject_evaluation_items", :force => true do |t|
    t.integer  "subject_evaluation_id"
    t.integer  "subject_evaluation_question_item_id"
    t.integer  "score_id"
    t.text     "explanation"
    t.integer  "total_choices"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "subject_evaluation_question_items", :force => true do |t|
    t.integer  "subject_evaluation_question_id"
    t.integer  "number_id"
    t.string   "score_0"
    t.string   "score_1"
    t.string   "score_2"
    t.string   "score_3"
    t.string   "score_4"
    t.text     "assesment"
    t.string   "score_5"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "subject_evaluation_questions", :force => true do |t|
    t.string   "title"
    t.text     "instruction"
    t.integer  "type_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subject_evaluations", :force => true do |t|
    t.integer  "administrator_id"
    t.integer  "curriculum_item_id"
    t.integer  "meet_id"
    t.text     "note"
    t.text     "recommendation"
    t.float    "total_point",                    :default => 0.0
    t.integer  "subject_evaluation_question_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "subject_item_assessments", :force => true do |t|
    t.integer  "position_id"
    t.integer  "subject_item_id"
    t.integer  "subject_assessment_id"
    t.integer  "percentage_id"
    t.integer  "status_id",             :default => 1
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "subject_items", :force => true do |t|
    t.integer  "position_id"
    t.integer  "subject_id"
    t.string   "title"
    t.decimal  "sks",                       :precision => 14, :scale => 2, :default => 0.0
    t.integer  "status_id",                                                :default => 1
    t.integer  "assessments_percentage_id",                                :default => 0
    t.datetime "created_at",                                                                :null => false
    t.datetime "updated_at",                                                                :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.string   "english_title"
    t.integer  "program_id"
    t.integer  "type_id",                                           :default => 0
    t.integer  "category_id",                                       :default => 0
    t.integer  "total_sks",                                         :default => 0
    t.integer  "sks_theory",                                        :default => 0
    t.integer  "sks_practice",                                      :default => 0
    t.integer  "sks_field_practice",                                :default => 0
    t.integer  "sks_simulation",                                    :default => 0
    t.string   "teaching_method"
    t.integer  "unit_id",                                           :default => 0
    t.integer  "syllabus_id",                                       :default => 0
    t.integer  "material_id",                                       :default => 0
    t.integer  "practice_id",                                       :default => 0
    t.integer  "book_id",                                           :default => 0
    t.date     "started_at"
    t.date     "ended_at"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.string   "feeder_id"
    t.decimal  "items_sks_id",       :precision => 14, :scale => 2, :default => 0.0
    t.boolean  "can_be_evaluate",                                   :default => true
  end

  create_table "survey_answer_items", :force => true do |t|
    t.integer  "survey_answer_id"
    t.integer  "survey_item_id"
    t.integer  "score_id"
    t.string   "comment"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "survey_answers", :force => true do |t|
    t.integer  "for_id"
    t.integer  "row_id"
    t.integer  "survey_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "survey_items", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "position_id",         :default => 0
    t.integer  "number_id",           :default => 0
    t.string   "description"
    t.integer  "scale_1_score",       :default => 0
    t.integer  "scale_2_score",       :default => 0
    t.integer  "scale_3_score",       :default => 0
    t.integer  "scale_4_score",       :default => 0
    t.integer  "scale_5_score",       :default => 0
    t.string   "scale_1_description"
    t.string   "scale_2_description"
    t.string   "scale_3_description"
    t.string   "scale_4_description"
    t.string   "scale_5_description"
    t.text     "recommendation"
    t.text     "follow_up"
    t.integer  "status_id",           :default => 1
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "surveys", :force => true do |t|
    t.integer  "for_id",                :default => 0
    t.string   "title"
    t.text     "description"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "number_of_respondents", :default => 0
    t.text     "recommendation"
    t.text     "follow_up"
    t.integer  "status_id",             :default => 1
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "faculty_id",            :default => 0
    t.integer  "program_id",            :default => 0
    t.integer  "semester_id",           :default => 0
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "term_of_payment_items", :force => true do |t|
    t.integer  "position_id",                                       :default => 0
    t.integer  "term_of_payment_id"
    t.integer  "type_of_payment_id"
    t.integer  "installment_id",                                    :default => 0
    t.decimal  "amount",             :precision => 14, :scale => 2, :default => 0.0
    t.string   "charged_on"
    t.integer  "status_id",                                         :default => 1
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
  end

  create_table "term_of_payments", :force => true do |t|
    t.integer  "program_id"
    t.integer  "year_id"
    t.integer  "selected_class_id"
    t.integer  "status_id",         :default => 1
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "theses", :force => true do |t|
    t.integer  "status_id",        :default => 1
    t.integer  "student_id"
    t.datetime "canceled_at"
    t.integer  "administrator_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "year_id"
    t.integer  "stage_id"
  end

  create_table "thesis_supports", :force => true do |t|
    t.integer  "thesis_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "article_file_name"
    t.string   "article_content_type"
    t.integer  "article_file_size"
    t.datetime "article_updated_at"
    t.text     "note"
    t.integer  "status_id",             :default => 0
    t.datetime "submitted_at"
    t.datetime "approved_at"
    t.datetime "rejected_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "thesis_titles", :force => true do |t|
    t.integer  "thesis_id"
    t.text     "title"
    t.text     "subtitle"
    t.text     "note"
    t.integer  "status_id",                                   :default => 0
    t.datetime "submitted_at"
    t.datetime "approved_at"
    t.datetime "rejected_at"
    t.decimal  "percentage",   :precision => 14, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "tracer_studies", :force => true do |t|
    t.integer  "student_id"
    t.integer  "R_2019_04_F5_01"
    t.integer  "T_2019_04_F5_02"
    t.integer  "T_2019_04_F5_03"
    t.integer  "R_2019_04_F12_01"
    t.string   "T_2019_04_F12_02"
    t.integer  "R_2019_04_F8"
    t.integer  "R_2019_04_F14"
    t.integer  "R_2019_04_F15"
    t.integer  "T_2019_04_F13_01"
    t.integer  "T_2019_04_F13_02"
    t.integer  "T_2019_04_F13_03"
    t.integer  "R_2019_04_F2_1"
    t.integer  "R_2019_04_F2_2"
    t.integer  "R_2019_04_F2_3"
    t.integer  "R_2019_04_F2_4"
    t.integer  "R_2019_04_F2_5"
    t.integer  "R_2019_04_F2_6"
    t.integer  "R_2019_04_F2_7"
    t.integer  "R_2019_04_F3_01"
    t.integer  "T_2019_04_F3_02"
    t.integer  "T_2019_04_F3_03"
    t.integer  "C_2019_04_F4_01"
    t.integer  "C_2019_04_F4_02"
    t.integer  "C_2019_04_F4_03"
    t.integer  "C_2019_04_F4_04"
    t.integer  "C_2019_04_F4_05"
    t.integer  "C_2019_04_F4_06"
    t.integer  "C_2019_04_F4_07"
    t.integer  "C_2019_04_F4_08"
    t.integer  "C_2019_04_F4_09"
    t.integer  "C_2019_04_F4_10"
    t.integer  "C_2019_04_F4_11"
    t.integer  "C_2019_04_F4_12"
    t.integer  "C_2019_04_F4_13"
    t.integer  "C_2019_04_F4_14"
    t.integer  "C_2019_04_F4_15"
    t.string   "T_2019_04_F4_16"
    t.integer  "T_2019_04_F6"
    t.integer  "T_2019_04_F7"
    t.integer  "T_2019_04_F7A"
    t.integer  "C_2019_04_F9_01"
    t.integer  "C_2019_04_F9_02"
    t.integer  "C_2019_04_F9_03"
    t.integer  "C_2019_04_F9_04"
    t.integer  "C_2019_04_F9_05"
    t.string   "T_2019_04_F9_06"
    t.integer  "R_2019_04_F10_01"
    t.string   "T_2019_04_F10_02"
    t.integer  "R_2019_04_F11_01"
    t.string   "T_2019_04_F11_02"
    t.integer  "C_2019_04_F16_01"
    t.integer  "C_2019_04_F16_02"
    t.integer  "C_2019_04_F16_03"
    t.integer  "C_2019_04_F16_04"
    t.integer  "C_2019_04_F16_05"
    t.integer  "C_2019_04_F16_06"
    t.integer  "C_2019_04_F16_07"
    t.integer  "C_2019_04_F16_08"
    t.integer  "C_2019_04_F16_09"
    t.integer  "C_2019_04_F16_10"
    t.integer  "C_2019_04_F16_11"
    t.integer  "C_2019_04_F16_12"
    t.integer  "C_2019_04_F16_13"
    t.string   "T_2019_04_F16_14"
    t.integer  "R_2019_04_F17_01"
    t.integer  "R_2019_04_F17_02B"
    t.integer  "R_2019_04_F17_03"
    t.integer  "R_2019_04_F17_04B"
    t.integer  "R_2019_04_F17_05"
    t.integer  "R_2019_04_F17_06B"
    t.integer  "R_2019_04_F17_05A"
    t.integer  "R_2019_04_F17_06BA"
    t.integer  "R_2019_04_F17_07"
    t.integer  "R_2019_04_F17_08B"
    t.integer  "R_2019_04_F17_09"
    t.integer  "R_2019_04_F17_10B"
    t.integer  "R_2019_04_F17_11"
    t.integer  "R_2019_04_F17_12B"
    t.integer  "R_2019_04_F17_13"
    t.integer  "R_2019_04_F17_14B"
    t.integer  "R_2019_04_F17_15"
    t.integer  "R_2019_04_F17_16B"
    t.integer  "R_2019_04_F17_17"
    t.integer  "R_2019_04_F17_18B"
    t.integer  "R_2019_04_F17_19"
    t.integer  "R_2019_04_F17_20B"
    t.integer  "R_2019_04_F17_21"
    t.integer  "R_2019_04_F17_22B"
    t.integer  "R_2019_04_F17_23"
    t.integer  "R_2019_04_F17_24B"
    t.integer  "R_2019_04_F17_25"
    t.integer  "R_2019_04_F17_26B"
    t.integer  "R_2019_04_F17_27"
    t.integer  "R_2019_04_F17_28B"
    t.integer  "R_2019_04_F17_29"
    t.integer  "R_2019_04_F17_30B"
    t.integer  "R_2019_04_F17_31"
    t.integer  "R_2019_04_F17_32B"
    t.integer  "R_2019_04_F17_33"
    t.integer  "R_2019_04_F17_34B"
    t.integer  "R_2019_04_F17_35"
    t.integer  "R_2019_04_F17_36B"
    t.integer  "R_2019_04_F17_37"
    t.integer  "R_2019_04_F17_38B"
    t.integer  "R_2019_04_F17_37A"
    t.integer  "R_2019_04_F17_38BA"
    t.integer  "R_2019_04_F17_39"
    t.integer  "R_2019_04_F17_40B"
    t.integer  "R_2019_04_F17_41"
    t.integer  "R_2019_04_F17_42B"
    t.integer  "R_2019_04_F17_43"
    t.integer  "R_2019_04_F17_44B"
    t.integer  "R_2019_04_F17_45"
    t.integer  "R_2019_04_F17_46B"
    t.integer  "R_2019_04_F17_47"
    t.integer  "R_2019_04_F17_48B"
    t.integer  "R_2019_04_F17_49"
    t.integer  "R_2019_04_F17_50B"
    t.integer  "R_2019_04_F17_51"
    t.integer  "R_2019_04_F17_52B"
    t.integer  "R_2019_04_F17_53"
    t.integer  "R_2019_04_F17_54B"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "transfer_grades", :force => true do |t|
    t.integer  "position_id",                                  :default => 0
    t.integer  "status_id",                                    :default => 1
    t.integer  "student_id"
    t.string   "source_code"
    t.string   "source_name"
    t.integer  "source_sks"
    t.string   "source_h_score"
    t.integer  "subject_id"
    t.string   "target_h_score"
    t.decimal  "target_a_score", :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.string   "feeder_id"
  end

  create_table "type_of_creations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_of_payments", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "english_title", :default => "Missing Translate"
  end

  create_table "type_of_sub_creations", :force => true do |t|
    t.string   "name"
    t.integer  "type_of_creation_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "validate_study_cards", :force => true do |t|
    t.integer  "administrator_id"
    t.string   "code"
    t.string   "start_code"
    t.string   "end_code"
    t.integer  "print_study_card_id"
    t.integer  "print_middle_card_id"
    t.integer  "print_final_card_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "verify_payments", :force => true do |t|
    t.string   "account_number"
    t.string   "account_holder"
    t.string   "name_of_bank"
    t.datetime "date_time_of_transfer"
    t.integer  "register_id"
    t.integer  "amount_of_transfer"
    t.integer  "payment_for_id"
    t.string   "note"
    t.string   "administrator_note"
    t.integer  "status_id"
    t.string   "proof_file_name"
    t.string   "proof_content_type"
    t.integer  "proof_file_size"
    t.datetime "proof_updated_at"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "verify_student_payments", :force => true do |t|
    t.string   "account_number"
    t.string   "account_holder"
    t.string   "name_of_bank"
    t.datetime "date_time_of_transfer"
    t.integer  "student_id"
    t.integer  "amount_of_transfer"
    t.string   "note"
    t.string   "administrator_note"
    t.integer  "status_id"
    t.string   "proof_file_name"
    t.string   "proof_content_type"
    t.integer  "proof_file_size"
    t.datetime "proof_updated_at"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

  create_table "wise_quotes", :force => true do |t|
    t.text     "quote"
    t.string   "owner"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
