class ResearchServiceActivityLog < ActiveRecord::Base

  #attr_accessible :administrator_id, :lecturer_id, :note, :research_service_request_id, :status_id

  belongs_to :research_service_activity
  belongs_to :lecturer
  belongs_to :administrator

  validates :note, :status_id, presence: true

  validate :check_status

  def status_caption
    ResearchServiceActivity::STATUS_TYPES[self.status_id]
  end

  def by_name
    if self.lecturer
      self.lecturer.name_with_title
    elsif self.administrator
      self.administrator.name
    end
  end

  def self.get_logs
    self.order 'created_at desc'
  end

  private

  def check_status
    unless self.research_service_activity.update_attributes status_id: self.status_id
      self.errors.add :base, self.research_service_activity.errors.full_messages.join(' | ')
    end
  end

end
