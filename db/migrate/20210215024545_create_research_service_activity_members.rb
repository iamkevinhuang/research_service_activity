class CreateResearchServiceActivityMembers < ActiveRecord::Migration
  def change
    create_table :research_service_activity_members do |t|

      t.integer  :research_service_activity_id
      t.integer  :position_id
      t.integer  :lecturer_id
      t.integer  :status_id

      t.timestamps
    end
  end
end
