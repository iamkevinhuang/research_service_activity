class CreateResearchServiceActivities < ActiveRecord::Migration
  def change
    create_table :research_service_activities do |t|

      t.integer :status_id, default: 0
      t.integer :lecturer_id
      t.integer :program_id
      t.integer :year_id
      t.integer :stage_id, default: 1

      t.integer :type_id, default: 0
      t.string :title
      t.integer :company_contact_title_id, default: 0
      t.string :company_contact_name
      t.string :company_title

      t.date :implementation_at

      t.date :requested_at
      t.date :assign_at
      t.date :reported_at

      t.string :request_sha_id
      t.string :assignment_sha_id
      t.string :report_sha_id

      t.string  :article_title
      t.integer :publisher_category_id, default: 0
      t.string  :publisher_title
      t.string  :publisher_license_number
      t.string  :publisher_url
      t.string  :article_url
      t.integer :publisher_year_id
      t.integer :publisher_volume_id
      t.integer :publisher_number_id
      t.string  :news_url
      t.string  :video_url

      t.attachment :request_certificate
      t.attachment :assignment_certificate
      t.attachment :report_certificate
      t.attachment :reply_document
      t.attachment :copyright_document
      t.attachment :optional_document

      t.timestamps
    end
  end
end
