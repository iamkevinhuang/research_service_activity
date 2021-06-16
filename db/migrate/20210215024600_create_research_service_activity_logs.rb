class CreateResearchServiceActivityLogs < ActiveRecord::Migration
  def change
    create_table :research_service_activity_logs do |t|

      t.integer  :research_service_activity_id
      t.integer  :status_id
      t.text     :note
      t.integer  :lecturer_id
      t.integer  :administrator_id

      t.timestamps
    end
  end
end
