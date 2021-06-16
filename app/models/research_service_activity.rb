class ResearchServiceActivity < ActiveRecord::Base

  belongs_to :lecturer
  belongs_to :student
  belongs_to :program

  has_many :logs, dependent: :destroy, class_name: 'ResearchServiceActivityLog'
  has_many :members, dependent: :destroy, class_name: 'ResearchServiceActivityMember'

  validate :check_status

  STATUS_TYPES = {
     0 => 'Draft Permohonan',
     1 => 'Permohonan diajukan ke Program Studi',
     2 => 'Permohonan ditolak Program Studi',
     3 => 'Permohonan disetujui Program Studi',
     4 => 'Permohonan ditolak Dekanat',
     5 => 'Permohonan disetujui Dekanat',
     6 => 'Permohonan ditolak Lembaga Penelitian dan Pengabdian Masyarakat',
     7 => 'Permohonan disahkan Lembaga Penelitian dan Pengabdian Masyarakat',

     8 => 'Draft Penugasan',
     9 => 'Penugasan diajukan ke Lembaga Penelitian dan Pengabdian Masyarakat',
     10 => 'Penugasan ditolak Lembaga Penelitian dan Pengabdian Masyarakat',
     11 => 'Penugasan disahkan Lembaga Penelitian dan Pengabdian Masyarakat',

     12 => 'Draft Pelaporan',
     13 => 'Pelaporan diajukan ke Program Studi',
     14 => 'Pelaporan ditolak Program Studi',
     15 => 'Pelaporan disetujui Program Studi',
     16 => 'Pelaporan ditolak Dekanat',
     17 => 'Pelaporan disetujui Dekanat',
     18 => 'Pelaporan ditolak Lembaga Penelitian dan Pengabdian Masyarakat',
     19 => 'Pelaporan disahkan Lembaga Penelitian dan Pengabdian Masyarakat'
  }

  DESCRIPTION_TYPES = {
     0  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[0] }, perhatikan isian permohonan, bila sudah benar, silakan klik tombol Ubah Status untuk #{self::STATUS_TYPES[1]}.",
     1  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[1] }, silakan menunggu proses persetujuan dari Program Studi.",
     2  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[2] }, silakan klik tombol Ubah Status menjadi #{self::STATUS_TYPES[0]} untuk mengoreksi Pengisian Permohonan berdasarkan catatan terakhir.",
     3  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[3] }, silakan menunggu proses persetujuan dari Dekanat.",
     4  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[4] }, silakan klik tombol Ubah Status menjadi #{self::STATUS_TYPES[0]} untuk mengoreksi Pengisian Permohonan berdasarkan catatan terakhir.",
     5  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[5] }, silakan menunggu proses pengesahan dari Lembaga Penelitian dan Pengabdian Masyarakat",
     6  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[6] }, silakan klik tombol Ubah Status menjadi #{self::STATUS_TYPES[0]} untuk mengoreksi Pengisian Permohonan berdasarkan catatan terakhir.",
     7  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[7] }, silakan klik tombol Ubah Status menjadi #{self::STATUS_TYPES[8]} untuk masuk ke tahapan Penugasan.",

     8  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[8] }, perhatikan isian penugasan, bila sudah benar, silakan klik tombol Ubah Status untuk #{self::STATUS_TYPES[9]}.",
     9  => "Permohonan saat ini berstatus #{self::STATUS_TYPES[9] }, silakan menunggu proses pengesahan dari Lembaga Penelitian dan Pengabdian Masyarakat",
     10 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[10]}, silakan klik tombol Ubah Status menjadi #{self::STATUS_TYPES[8]} untuk mengoreksi Pengisian Penugasan berdasarkan catatan terakhir.",
     11 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[11] }, silakan klik tombol Ubah Status menjadi #{self::STATUS_TYPES[12]} untuk masuk ke tahapan Pelaporan.",

     12 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[12] }, perhatikan isian pelaporan, bila sudah benar, silakan klik tombol Ubah Status untuk #{self::STATUS_TYPES[13]}.",
     13 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[13] }, silakan menunggu proses persetujuan dari Program Studi.",
     14 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[14] }, silakan klik tombol Ubah Status menjadi #{self::STATUS_TYPES[12]} untuk mengoreksi Pengisian Pelaporan berdasarkan catatan terakhir.",
     15 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[15] }, silakan menunggu proses persetujuan dari Dekanat.",
     16 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[16] }, silakan klik tombol Ubah Status menjadi #{self::STATUS_TYPES[12]} untuk mengoreksi Pengisian Pelaporan berdasarkan catatan terakhir.",
     17 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[17] }, silakan menunggu proses pengesahan dari Lembaga Penelitian dan Pengabdian Masyarakat",
     18 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[18] }, silakan klik tombol Ubah Status menjadi #{self::STATUS_TYPES[12]} untuk mengoreksi Pengisian Pelaporan berdasarkan catatan terakhir.",
     19 => "Permohonan saat ini berstatus #{self::STATUS_TYPES[19] }, kegiatan sudah selesai!"
  }

  # has_attached_file :request_certificate,
  #   path: ":rails_root/public:url",
  #   url: "/documents/:class/:id/:hash.:extension",
  #   hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  has_attached_file :request_certificate,
    storage: :s3,
    s3_credentials: { access_key_id: APP_CONFIG[:aws_s3]['access_key_id'], secret_access_key: APP_CONFIG[:aws_s3]['secret_access_key'] },
    bucket: APP_CONFIG[:aws_s3]['assets_bucket'],
    s3_headers: {'Expires' => 5.year.from_now.httpdate},
    use_timestamp: false,
    s3_host_alias: APP_CONFIG[:aws_s3]['host_alias'],
    url: ":s3_alias_url",
    path: "/documents/:class/:id/:hash.:extension",
    hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  # has_attached_file :reply_document,
  #   path: ":rails_root/public:url",
  #   url: "/documents/:class/:id/:hash.:extension",
  #   hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  has_attached_file :reply_document,
    storage: :s3,
    s3_credentials: { access_key_id: APP_CONFIG[:aws_s3]['access_key_id'], secret_access_key: APP_CONFIG[:aws_s3]['secret_access_key'] },
    bucket: APP_CONFIG[:aws_s3]['assets_bucket'],
    s3_headers: {'Expires' => 5.year.from_now.httpdate},
    use_timestamp: false,
    s3_host_alias: APP_CONFIG[:aws_s3]['host_alias'],
    url: ":s3_alias_url",
    path: "/documents/:class/:id/:hash.:extension",
    hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  validates_attachment :reply_document,
    content_type: { content_type: ['application/pdf'] },
    size: { less_than: 1.megabytes, message: 'harus lebih kecil dari 1MB' }


  # has_attached_file :assignment_certificate,
  #   path: ":rails_root/public:url",
  #   url: "/documents/:class/:id/:hash.:extension",
  #   hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  has_attached_file :assignment_certificate,
    storage: :s3,
    s3_credentials: { access_key_id: APP_CONFIG[:aws_s3]['access_key_id'], secret_access_key: APP_CONFIG[:aws_s3]['secret_access_key'] },
    bucket: APP_CONFIG[:aws_s3]['assets_bucket'],
    s3_headers: {'Expires' => 5.year.from_now.httpdate},
    use_timestamp: false,
    s3_host_alias: APP_CONFIG[:aws_s3]['host_alias'],
    url: ":s3_alias_url",
    path: "/documents/:class/:id/:hash.:extension",
    hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  # has_attached_file :copyright_document,
  #   path: ":rails_root/public:url",
  #   url: "/documents/:class/:id/:hash.:extension",
  #   hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  has_attached_file :copyright_document,
    storage: :s3,
    s3_credentials: { access_key_id: APP_CONFIG[:aws_s3]['access_key_id'], secret_access_key: APP_CONFIG[:aws_s3]['secret_access_key'] },
    bucket: APP_CONFIG[:aws_s3]['assets_bucket'],
    s3_headers: {'Expires' => 5.year.from_now.httpdate},
    use_timestamp: false,
    s3_host_alias: APP_CONFIG[:aws_s3]['host_alias'],
    url: ":s3_alias_url",
    path: "/documents/:class/:id/:hash.:extension",
    hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  validates_attachment :copyright_document,
    content_type: { content_type: ['application/pdf'] },
    size: { less_than: 3.megabytes, message: 'harus lebih kecil dari 3MB' }

  # has_attached_file :optional_document,
  #   path: ":rails_root/public:url",
  #   url: "/documents/:class/:id/:hash.:extension",
  #   hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  has_attached_file :optional_document,
    storage: :s3,
    s3_credentials: { access_key_id: APP_CONFIG[:aws_s3]['access_key_id'], secret_access_key: APP_CONFIG[:aws_s3]['secret_access_key'] },
    bucket: APP_CONFIG[:aws_s3]['assets_bucket'],
    s3_headers: {'Expires' => 5.year.from_now.httpdate},
    use_timestamp: false,
    s3_host_alias: APP_CONFIG[:aws_s3]['host_alias'],
    url: ":s3_alias_url",
    path: "/documents/:class/:id/:hash.:extension",
    hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  validates_attachment :optional_document,
    content_type: { content_type: ['application/pdf'] },
    size: { less_than: 5.megabytes, message: 'harus lebih kecil dari 5MB' }

  # has_attached_file :report_certificate,
  #   path: ":rails_root/public:url",
  #   url: "/documents/:class/:id/:hash.:extension",
  #   hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  has_attached_file :report_certificate,
    storage: :s3,
    s3_credentials: { access_key_id: APP_CONFIG[:aws_s3]['access_key_id'], secret_access_key: APP_CONFIG[:aws_s3]['secret_access_key'] },
    bucket: APP_CONFIG[:aws_s3]['assets_bucket'],
    s3_headers: {'Expires' => 5.year.from_now.httpdate},
    use_timestamp: false,
    s3_host_alias: APP_CONFIG[:aws_s3]['host_alias'],
    url: ":s3_alias_url",
    path: "/documents/:class/:id/:hash.:extension",
    hash_secret: 'universitas_prima_indonesia_is_the_best_choice'

  def self.on_progress programs, statuses
    rows = self.includes [ :lecturer, :program ]
    rows = rows.order :updated_at
    rows = rows.where program_id: programs
    rows = rows.where status_id: statuses
    rows
  end

  def status_caption
    STATUS_TYPES[self.status_id]
  end

  def status_description
    DESCRIPTION_TYPES[self.status_id]
  end

  COMPANY_CONTACT_TITLE_TYPES = {
     0 => 'Bapak',
     1 => 'Ibu'
  }

  def company_contact_caption
    "#{self.company_contact_title_caption} #{self.company_contact_name}"
  end

  def company_contact_title_caption
    COMPANY_CONTACT_TITLE_TYPES[self.company_contact_title_id]
  end

  def self.company_contact_title_types
    COMPANY_CONTACT_TITLE_TYPES.invert
  end

  TYPE_TYPES = {
     0 => 'Penelitian',
     1 => 'Pengabdian Masyarakat'
  }

  def type_caption
    TYPE_TYPES[self.type_id]
  end

  def self.type_types
    TYPE_TYPES.invert
  end

  PUBLISHER_CATEGORY_TYPES = {
     0 => '-',
     1 => 'Prosiding Lokal',
     2 => 'Prosiding Nasional',
     3 => 'Prosiding Internasional',
     4 => 'Jurnal Nasional',
     5 => 'Jurnal Nasional Terakreditasi',
     6 => 'Jurnal Internasional',
     7 => 'Jurnal Internasional Bereputasi'
  }

  def publisher_category_caption
    PUBLISHER_CATEGORY_TYPES[self.publisher_category_id]
  end

  def self.publisher_category_types
    PUBLISHER_CATEGORY_TYPES.invert
  end


  def self.get_requests_recapitulation_by_program_and_status programs_id, status_id
    rows = self.where 'program_id in (?)', programs_id
    rows = rows.where 'status_id = ?', status_id
    rows = rows.group 'program_id'
    rows = rows.count
  end

  def back_to_draft_request!
    from = self.status_id
    to = 0
    self.update_attributes status_id: to
    self.logs.create status_id: to, note: "Mengubah status dari #{ResearchServiceActivity::STATUS_TYPES[from]} menjadi #{ResearchServiceActivity::STATUS_TYPES[to]}.", lecturer_id: self.lecturer_id
  end

  def back_to_draft_assignment!
    from = self.status_id
    to = 8
    self.update_attributes status_id: to
    self.logs.create status_id: to, note: "Mengubah status dari #{ResearchServiceActivity::STATUS_TYPES[from]} menjadi #{ResearchServiceActivity::STATUS_TYPES[to]}.", lecturer_id: self.lecturer_id
  end

  def back_to_draft_report!
    from = self.status_id
    to = 12
    self.update_attributes status_id: to
    self.logs.create status_id: to, note: "Mengubah status dari #{ResearchServiceActivity::STATUS_TYPES[from]} menjadi #{ResearchServiceActivity::STATUS_TYPES[to]}.", lecturer_id: self.lecturer_id
  end

  def reset!
    from = self.status_id
    to = 0
    self.update_attributes status_id: to
    self.logs.create status_id: to, note: "Mengubah status dari #{ResearchServiceActivity::STATUS_TYPES[from]} menjadi #{ResearchServiceActivity::STATUS_TYPES[to]}.", lecturer_id: self.lecturer_id
  end

  def compile_sha_id
    case self.status_id
    when 7
      Digest::SHA1.hexdigest('surat_permohonan' + self.id.to_s + Time.zone.now.to_s)
    when 11
      Digest::SHA1.hexdigest('surat_penugasan' + self.id.to_s + Time.zone.now.to_s)
    when 19
      Digest::SHA1.hexdigest('surat_laporan' + self.id.to_s + Time.zone.now.to_s)
    end
  end

  def compile_request_certificate!
    self.request_sha_id = self.compile_sha_id
    self.requested_at = Time.zone.now

    document = CombinePDF.new
    compilation = ResearchServiceActivityRequestCertificatePdf.new self
    document << CombinePDF.parse(compilation.render)

    file = StringIO.new document.to_pdf
    file.class.class_eval{ attr_accessor :original_filename, :content_type }
    file.original_filename = "#{self.id}_surat_permohonan.pdf"
    file.content_type = "application/pdf"

    self.request_certificate = file

    if self.save
      SignatureContainer.create sha_id: self.request_sha_id, model_name: 'ResearchServiceActivity', model_id: self.id
    end

  end

  def request_certificate_number
    roman = ['I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII']
    "#{self.id}/SPKPP/M/#{self.type_caption}/LPPM/UNPRI/#{roman[self.requested_at.month - 1]}/#{self.requested_at.year}"
  end

  def compile_assignment_certificate!
    self.assignment_sha_id = self.compile_sha_id
    self.assign_at = Time.zone.now

    document = CombinePDF.new
    compilation = ResearchServiceActivityAssignmentCertificatePdf.new self
    document << CombinePDF.parse(compilation.render)

    file = StringIO.new document.to_pdf
    file.class.class_eval{ attr_accessor :original_filename, :content_type }
    file.original_filename = "#{self.id}_surat_penugasan.pdf"
    file.content_type = "application/pdf"

    self.assignment_certificate = file

    if self.save
      SignatureContainer.create sha_id: self.assignment_sha_id, model_name: 'ResearchServiceActivity', model_id: self.id
    end

  end

  def assignment_certificate_number
    roman = ['I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII']
    "#{self.id}/SPKPP/T/#{self.type_caption}/LPPM/UNPRI/#{roman[self.requested_at.month - 1]}/#{self.requested_at.year}"
  end

  def compile_report_certificate!
    self.report_sha_id = compile_sha_id
    self.reported_at = Time.zone.now

    document = CombinePDF.new
    compilation = ResearchServiceActivityReportCertificatePdf.new self
    document << CombinePDF.parse(compilation.render)

    file = StringIO.new document.to_pdf
    file.class.class_eval{ attr_accessor :original_filename, :content_type }
    file.original_filename = "#{self.id}_surat_pelaporan.pdf"
    file.content_type = "application/pdf"

    self.report_certificate = file

    if self.save
      SignatureContainer.create sha_id: self.report_sha_id, model_name: 'ResearchServiceActivity', model_id: self.id
    end

  end

  def report_certificate_number
    roman = ['I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII']
    "#{self.id}/SPKPP/L/#{self.type_caption}/LPPM/UNPRI/#{roman[self.reported_at.month - 1]}/#{self.reported_at.year}"
  end

  def year_stage_caption
    "#{self.year_id}/#{self.stage_id}"
  end

  def self.program_types
    programs = Program.order :position_id
    programs = programs.where 'id not in(15,16)'
    programs = programs.map{|program| [program.title, program.id]}
  end

  def self.year_types
    (2019..Time.zone.now.year)
  end

  def self.stage_types
    (1..2)
  end

  def program_title
    self.program.title
  end

  def lecturer_name_code
    "#{self.lecturer.name} - #{self.lecturer.code}"
  end

  private

  def check_status

    case self.status_id

    when 1
      self.errors.add( :title, 'wajib diisi!' ) if self.title.blank?
      self.errors.add( :company_contact_name, 'wajib diisi!' ) if self.company_contact_name.blank?
      self.errors.add( :company_title, 'wajib diisi!' ) if self.company_title.blank?

    when 9
      self.errors.add( :reply_document, 'wajib diisi!' ) unless self.reply_document.exists?

    when 13
      self.errors.add( :publisher_category_id, 'wajib diisi!' ) if self.publisher_category_id == 0
      self.errors.add( :publisher_title, 'wajib diisi!' ) if self.publisher_title.blank?
      self.errors.add( :publisher_license_number, 'wajib diisi!' ) if self.publisher_license_number.blank?
      self.errors.add( :publisher_year_id, 'wajib diisi!' ) if self.publisher_year_id.nil?

      if [4,5,6,7].include? self.publisher_category_id
        self.errors.add( :publisher_volume_id, 'wajib diisi!' ) if self.publisher_volume_id.nil?
        self.errors.add( :publisher_number_id, 'wajib diisi!' ) if self.publisher_number_id.nil?
      else
        self.publisher_volume_id = nil
        self.publisher_number_id = nil
      end

      self.errors.add( :publisher_url, 'wajib diisi!' ) if self.publisher_url.blank?
      self.errors.add( :article_url, 'wajib diisi!' ) if self.article_url.blank?

      if self.type_id == 1
        self.errors.add( :news_url, 'wajib diisi!' ) if self.news_url.blank?
        self.errors.add( :video_url, 'wajib diisi!' ) if self.video_url.blank?
        self.errors.add( :copyright_document, 'wajib diisi!' ) unless self.copyright_document.exists?
      else
        self.news_url = nil
        self.video_url = nil
        self.copyright_document = nil
      end

    end

  end

end
