class Lecturer < ActiveRecord::Base
  has_many :research_service_activities

  validates_presence_of :name

  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => { :access_key_id => APP_CONFIG[:aws_s3]['access_key_id'], :secret_access_key => APP_CONFIG[:aws_s3]['secret_access_key'] },
    :bucket => APP_CONFIG[:aws_s3]['assets_bucket'],
    :s3_headers => {'Expires' => 1.year.from_now.httpdate},
    :use_timestamp => false,
    :s3_host_alias => APP_CONFIG[:aws_s3]['host_alias'],
    :url => ":s3_alias_url",
    :default_url => '/images/missing-:style.jpg',
    :path => "/images/:class/:id/:id-:style.:extension",
    :styles => { :xxlarge => '800x1200>', :xlarge => '400x600>', :large => '200x300>', :medium => '100x150>', :small => '50x75>', :mini => '25x38>' }

  attr_accessor :password

  validates :email, uniqueness: true, allow_blank: false
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 10 }

  def name_with_title
    full_name = self.name
    full_name = self.front_title + " " + full_name unless self.front_title.blank?
    full_name = full_name + ", " + self.rear_title unless self.rear_title.blank?
    full_name
  end

  def short_name_with_title
    full_name = self.short_name
    full_name = self.front_title + " " + full_name unless self.front_title.blank?
    full_name = full_name + ", " + self.rear_title unless self.rear_title.blank?
    full_name
  end


  def self.search_by(search_string)
    find(
      :all,
      :conditions => ['lower(lecturers.id || lecturers.code || lecturers.name) like lower(?)', "%#{search_string}%"],
      :order => 'lecturers.name'
    )
  end

  def self.browse_by(search_string)
    lists = self.order(:name)
    lists = lists.where('lower(lecturers.id || lecturers.name) like lower(?)', "%#{search_string}%")
    lists = lists.where('lecturers.status_id = 1')
    lists = lists.limit(10)
  end

  def browse_key
    "#{self.name} - ##{self.id}"
  end

  def self.find_by_browse_key(key)
    find_by_id key.split(' - #')[1]
  end

  def self.authenticate( email, pass )
    lecturer = self.find_by_email email

    if lecturer
      if lecturer.password_salt.nil?
        return nil
      else
        return lecturer if lecturer.matching_password?(pass)
      end
    else
      return nil
    end
  end

  def matching_password?(pass)
    self.encrypted_password == encrypt_password(pass)
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Lecturer.exists?( column => self[column] )
  end

  def prepare_password
    unless self.password == '1234567890'
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = encrypt_password(password)
    end
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, self.password_salt)
  end

  def code_and_name
    "#{self.code} - #{self.name}"
  end

  def name_with_sex_and_title
    value = self.name_with_title
    case sex_id
    when 1
      value = 'Bapak ' + value
    when 2
      value = 'Ibu ' + value
    end
    value
  end

  def current_program_title
    Program.find(self.current_program_id).title
  end

  def current_year_stage
    "#{self.current_year_id} / #{self.current_stage_id}"
  end

  def current_year_stage_program_title
    "#{self.current_year_stage} - #{self.current_program_title}"
  end
end

