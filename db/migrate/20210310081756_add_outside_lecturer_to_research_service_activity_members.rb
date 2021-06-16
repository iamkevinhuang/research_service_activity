class AddOutsideLecturerToResearchServiceActivityMembers < ActiveRecord::Migration
  def change
    add_column :research_service_activity_members, :lecturer_number, :string
    add_column :research_service_activity_members, :lecturer_name, :string
    add_column :research_service_activity_members, :lecturer_institution_id, :integer
  end
end
