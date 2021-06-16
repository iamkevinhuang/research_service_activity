class ResearchServiceActivityReportCertificatePdf < Prawn::Document
  require 'prawn/qrcode'
  require 'prawn/measurement_extensions'

  def initialize research_service_activity
    @research_service_activity = research_service_activity

    domain = 'unprimdn.ac.id'
    @qr_code = RQRCode::QRCode.new "http://#{domain}/search_engines/#{@research_service_activity.report_sha_id}"

    super margin: 0, page_size: 'A4', page_layout: :portrait
    font 'Times-Roman'
    font_size 12
    image open("#{Rails.root}/public/images/kop-surat-unpri-lppm.jpg"),:width => bounds.width, :height => bounds.height
    move_up bounds.height
    indent(30,30) do
      header
      body
      signature
    end
  end

  def header
    move_down 110
    text "Medan, #{datetime_to_string @research_service_activity.reported_at, :dateonly }", align: :right

    table number_table, cell_style: { border_width: 0, padding: [0, 0, 0, 0] } do
      column(0).width = 50
      column(1).width = 20
    end

    move_down 20

  end

  def number_table
    [
      [{ content: 'Nomor'}, { content: ':'}, { content: @research_service_activity.request_certificate_number }],
      [{ content: 'Perihal'}, { content: ':'}, { content: "Surat Pelaporan #{@research_service_activity.type_caption}" }]
    ]
  end

  def body
    text "Lembaga Penelitian dan Pengabdian Masyarakat Universitas Prima Indonesia, melalui surat ini menyatakan bahwa tim dibawah ini yaitu:", align: :justify

    move_down 10
    table lecturer_table + member_table, width: bounds.width do
      row(0).font_style = :bold
      row(0).align = :center
      column(0).width = 30
      column(0).align = :center
      column(2).align = :center
    end

    move_down 20

    text "Memang benar telah menyelesaikan kegiatan #{@research_service_activity.type_caption} yang dimulai pada hari <b>#{datetime_to_string @research_service_activity.implementation_at, :long}</b> dengan judul kegiatan <b>#{@research_service_activity.title}</b>. Adapun keluaran dari kegiatan ini telah dipublikasikan pada #{@research_service_activity.publisher_category_caption} sebagai berikut:", align: :justify, inline_format: true

    table publisher_table, cell_style: { border_width: 0, padding: [0, 0, 0, 0] }, position: 50 do
      column(0).width = 100
      column(1).width = 20
      column(2).width = 380
    end

    move_down 20
    text "Demikian surat pelaporan ini diberikan agar dapat digunakan sebagaimana mestinya.", align: :justify, inline_format: true
  end

  def signature
    signer = Lecturer.find_by_id ApplicationConfiguration.find_by_key('head_of_research_service').value
    move_down 20
    indent(300) do
      text 'Kepala Lembaga,'
      move_down 110
      indent(-8) do
        render_qr_code(@qr_code, dot: 2.0, align: :left)
      end
      text signer.name_with_title, style: :bold
    end
  end

  def publisher_table
    table = [
      [{ content: ResearchServiceActivity.human_attribute_name(:publisher_title)}, { content: ':'}, { content: @research_service_activity.publisher_title}],
      [{ content: ResearchServiceActivity.human_attribute_name(:publisher_year_id)}, { content: ':'}, { content: @research_service_activity.publisher_year_id.to_s}],
    ]
    if [4,5,6,7].include? @research_service_activity.publisher_category_id
      table += [
        [{ content: ResearchServiceActivity.human_attribute_name(:publisher_volume_id)}, { content: ':'}, { content: @research_service_activity.publisher_volume_id.to_s}],
        [{ content: ResearchServiceActivity.human_attribute_name(:publisher_number_id)}, { content: ':'}, { content: @research_service_activity.publisher_number_id.to_s}],
      ]
    end
    table += [
      [{ content: ResearchServiceActivity.human_attribute_name(:article_title)}, { content: ':'}, { content: @research_service_activity.article_title}],
      [{ content: ResearchServiceActivity.human_attribute_name(:article_url)}, { content: ':'}, { content: @research_service_activity.article_url}],
    ]
    if @research_service_activity.type_id == 1
      table += [
        [{ content: ResearchServiceActivity.human_attribute_name(:news_url)}, { content: ':'}, { content: @research_service_activity.news_url}],
        [{ content: ResearchServiceActivity.human_attribute_name(:video_url)}, { content: ':'}, { content: @research_service_activity.video_url}],
      ]
    end
    table
  end

  def lecturer_table
    [
      [{ content: 'No'}, { content: 'Nama'}, { content: 'NIDN'}, {content: 'Asal Institusi'}],
      [{ content: '1'}, { content: @research_service_activity.lecturer.name_with_title}, { content: @research_service_activity.lecturer.code}, {content: 'Universitas Prima Indonesia'}]
    ]
  end

  def member_table
    counter = 1
    @members = @research_service_activity.members.where 'status_id = 1'
    @members = @members.order 'position_id'
    @members.map do |item|
      [{ content: "#{counter+=1}"}, { content: item.lecturer_name_with_title}, { content: item.lecturer_code}, {content: item.lecturer_institution_name}]
    end
  end


  def datetime_to_string data, format
    data.nil? ? '---' : I18n.l(data, format: format)
  end


end
