class ResearchServiceActivityMember < ActiveRecord::Base

  #attr_accessible :lecturer_id, :position_id, :research_service_activity_id, :status_id, :lecturer_browse_key

  STATUS_TYPES = {
    0 => 'Diajukan',
    1 => 'Disetujui',
    2 => 'Ditolak',
    3 => 'Dibatalkan'
  }

  belongs_to :research_service_activity
  belongs_to :lecturer
  belongs_to :lecturer_institution, class_name: 'Institution', foreign_key: 'lecturer_institution_id'

  validate :check_lecturer

  validates_presence_of :lecturer_name, :if => :outside_lecturer?
  validates_presence_of :lecturer_institution_id, :if => :outside_lecturer?

  after_save :create_logs

  def outside_lecturer?
    if self.lecturer_id == 0
      return true
    else
      return false
    end
  end

  def lecturer_browse_key
    if self.lecturer_id
      lecturer_code = Lecturer.find self.lecturer_id
      lecturer_code.browse_key
    end
  end

  def lecturer_browse_key=(browse_key)
    self.lecturer_id = browse_key.split(' - #')[1]
  end

  def lecturer_code
    if self.lecturer_id == 0
      self.lecturer_number.to_s.length > 0 ? self.lecturer_number : '?'
    else
      self.lecturer ? self.lecturer.code : '?'
    end
  end

  def lecturer_name_with_title
    if self.lecturer_id == 0
      self.lecturer_name.to_s.length > 0 ? self.lecturer_name : '?' 
    else
      self.lecturer ? self.lecturer.name_with_title : '?'
    end
  end

  def lecturer_code= code
    lecturer = Lecturer.find_by_code code
    self.lecturer_id = lecturer ? lecturer.id : nil
  end

  def lecturer_name_and_code
    self.lecturer ? "#{self.lecturer.name} (#{self.lecturer.code})" : '?'
  end

  def lecturer_institution_name
    if self.lecturer_id == 0
      self.lecturer_institution ? self.lecturer_institution.name : '?'
    else
      self.lecturer ? "Universitas Prima Indonesia" : '?'
    end
  end

  def agree!
    self.update_attributes status_id: 1
  end

  def reject!
    self.update_attributes status_id: 2
  end

  def self.status_types
    STATUS_TYPES.invert
  end

  def status_caption
    STATUS_TYPES[self.status_id]
  end

  def institution_browse_key
    self.lecturer_institution.browse_key if self.lecturer_institution
  end

  def institution_browse_key=(browse_key)
    self.lecturer_institution_id = browse_key.split(' - #')[1]
  end

  private

  def create_logs

    case self.status_id
    when 0
      log_lecturer_id = self.research_service_activity.lecturer_id
      log_note = "Diajukan kepada #{self.lecturer_name_and_code} sebagai Anggota Peneliti #{self.position_id}."
    when 1
      log_lecturer_id = self.lecturer_id
      log_note = "Disetujui oleh #{self.lecturer_name_and_code} sebagai Anggota Peneliti #{self.position_id}."
    when 2
      log_lecturer_id = self.lecturer_id
      log_note = "Ditolak oleh #{self.lecturer_name_and_code} sebagai Anggota Peneliti #{self.position_id}."
    when 3
      log_lecturer_id = self.research_service_activity.lecturer_id
      log_note = "Anggota Peneliti dibatalkan."
    end
    self.research_service_activity.logs.create status_id: self.research_service_activity.status_id, lecturer_id: log_lecturer_id, note: log_note
  end

  def check_lecturer

    # Anggota Peneliti tidak boleh sama dengan Ketua Peneliti
    if self.research_service_activity.lecturer_id == self.lecturer_id
      self.errors.add :lecturer_id, 'tidak boleh sama dengan Ketua Peneliti di Penelitian ini!'
    end

    # Anggota Peneliti sudah terdaftar sebelumnya dan hanya ngecek dosen unpri
    if self.lecturer_id && self.lecturer_id != 0
      members = ResearchServiceActivityMember.where lecturer_id: self.lecturer_id
      members = members.where research_service_activity_id: self.research_service_activity_id
      if members.size > 0
        if members.size == 1
          if members[0].id == self.id
            # mengoreksi dirinya sendiri
          else
            self.errors.add :lecturer_id, 'sudah terdaftar!'
          end
        else
          self.errors.add :lecturer_id, 'sudah terdaftar!'
        end
      end
    end

    if self.status_id == 3
      self.lecturer_id = nil
      self.lecturer_number = nil
      self.lecturer_name = nil
      self.lecturer_institution_id = nil
    end
  end

end
