module ApplicationHelper

  def value_to_char_400 value
    if value > 360 && value < 401
      return 'A'
    elsif value > 300 && value < 361
      return 'B'
    elsif value > 200 && value < 301
      return 'C'
    elsif value > 100 && value < 301
      return 'D'
    elsif value >= 0 && value < 101
      return 'E'
    end
  end

  def value_to_character value
    case
    when value >= 80 then 'A'
    when value >= 70 then 'B'
    when value >= 60 then 'C'
    when value >= 50 then 'D'
    else 'E'
    end
  end

  def character_to_number character
    case character
    when 'A' then 4
    when 'B' then 3
    when 'C' then 2
    when 'D' then 1
    else 0
    end
  end

  def version_object(version, current)
    if version.next.nil?
      before = version.object.nil? ? {} : YAML::load(version.object)
      after = current.attributes
    else
      before = version.object.nil? ? {} : YAML::load(version.object)
      after = YAML::load(version.next.object.to_s)
    end

    difference = {}

    after.each do |key, value|
      difference[key] = value if before[key] != after[key]
    end
    difference
  end

  def administrator_role_check?(roles)
    access = false
    roles.each do |role|
      access = true if current_administrator.role? role
    end
    access
  end


  def generate_years
    (2010..application_configuration_current_year_id+5)
  end

  def generate_stages
    { 'Tahapan 0' => 0, 'Tahapan 1' => 1, 'Tahapan 2' => 2 }
  end

  def generate_programs
    programs = Program.order 'programs.position_id'
    
  end

  def generate_range year_id, stage_id, up_to
    range = [{ :year_id => year_id, :stage_id => stage_id }]

    up_to.times do
      stage_id = stage_id + 1
      if stage_id > 2
        stage_id = 0
        year_id = year_id + 1
      end
      range << { :year_id => year_id, :stage_id => stage_id }
    end
    range
  end

  def hash_id data
    "##{data.id}"
  end

  def datetime_to_string data, format
    data.nil? ? '?' : l(data, :format => format)
  end

  def date_to_string_in_english data
    data.strftime "%B #{data.day.ordinalize}, %Y"
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, nil, :class => 'btn btn-small remove_field')
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to name, nil, :class => 'btn btn-small add_field', 'data-field' => "#{fields}", 'data-association' => association
  end

  def number_to_accounting(value)
    number_to_currency value, :format => '%n'
  end

  def to_indonesian(value)

    return 'nol' if value == 0

    units = [nil,'satu','dua','tiga','empat','lima','enam','tujuh','delapan','sembilan']
    thousands = ['ribu', 'juta', 'milyar', 'triliun']

    value = value.to_i.to_s

    case value.size % 3
    when 1 then value = '00' + value
    when 2 then value = '0' + value
    end

    value = value.scan(/.../)

    result = ''
    value.each_with_index do |chars, index|
      unless chars == '000'
        if chars[0] == '1'
          result += 'seratus '
        elsif chars[0] != '0'
          result += units[chars[0].to_i] + ' ratus '
        end

        if chars[1] == '1'
          case chars[2].to_i
          when 0 then result += 'sepuluh '
          when 1 then result += 'sebelas '
          else
            result += units[chars[2].to_i] + ' belas '
          end
        elsif chars[1] != '0'
          result += units[chars[1].to_i] + ' puluh '
        end

        if chars[2] != '0' && chars[1] != '1'
          result += units[chars[2].to_i] + ' '
        end

        result += thousands[value.size - index - 2] + ' ' unless value.size - 1 == index
      end
    end
    result.gsub(/satu ribu/, 'seribu').strip

  end

  def honors_grade score
    case
    when score >= 2 && score <= 2.75 then 'Memuaskan'
    when score > 2.75 && score <= 3.5 then 'Sangat Memuaskan'
    when score > 3.5 && score <= 4 then 'Dengan Pujian'
    else
      'Cukup'
    end
  end

  def honors_grade_in_english score
    case
    when score >= 2 && score <= 2.75 then 'Good'
    when score > 2.75 && score <= 3.5 then 'Very Good'
    when score > 3.5 && score <= 4 then 'Cum Laude'
    else
      'Cukup'
    end
  end

  def service_status_caption_with_description service
    case service.status_id
    when 0
      'Permohonan masih berstatus Draft, silakan klik tombol Ajukan Permohonan untuk diproses oleh Biro Administrasi Akademik Fakultas.'
    when 1
      "Permohonan sudah diajukan pada #{ datetime_to_string service.submitted_at, :long } dengan status Baru, dan menunggu balasan dari Biro Administrasi Akademik Fakultas."
    when 2
      "Permohonan sedang dalam Proses, balasan terakhir diproses oleh #{ service.taken_by_name } pada #{ datetime_to_string service.processed_at, :long }"
    when 3
      "Permohonan Ditunda, balasan terakhir diproses oleh #{ service.taken_by_name } pada #{ datetime_to_string service.processed_at, :long }"
    when 4
      "Permohonan sudah Selesai, diselesaikan oleh #{ service.taken_by_name } pada #{ datetime_to_string service.processed_at, :long } dan sedang menunggu untuk ditutup oleh Program Studi."
    when 5
      "Permohonan sudah Ditutup, dibalas oleh #{ service.taken_by_name } dan ditutup oleh #{ service.closed_by_name }"
    end
  end

  def send_whatsapp_message_by_api message, phone_number, country_code
    params = {
      client_id: "3761",
      api_key: "2017c7829636b46cf6c13445a3edddc7ca9bf934",
      whatsapp_client: "2674",
      msg_type: 0,
      msg: message,
      phone: phone_number,
      country_code: country_code
    }

    response = Excon.post('https://wbiztool.com/api/v1/send_msg/', :body => params.to_json)
  end

end
