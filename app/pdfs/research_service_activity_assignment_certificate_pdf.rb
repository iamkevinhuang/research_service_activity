class ResearchServiceActivityAssignmentCertificatePdf < Prawn::Document
  require 'prawn/qrcode'
  require 'prawn/measurement_extensions'

  def initialize research_service_activity
    @research_service_activity = research_service_activity

    domain = 'unprimdn.ac.id'
    @qr_code = RQRCode::QRCode.new "http://#{domain}/search_engines/#{@research_service_activity.assignment_sha_id}"

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

    text "Medan, #{datetime_to_string @research_service_activity.assign_at, :dateonly }", align: :right

    table number_table, cell_style: { border_width: 0, padding: [0, 0, 0, 0] } do
      column(0).width = 50
      column(1).width = 20
    end

    move_down 20
    table contact_table, cell_style: { border_width: 0, padding: [0, 0, 0, 0], font_style: :bold } do
      column(0).width = 30
    end

    move_down 20
  end

  def body
    text "Sehubungan dengan kegiatan #{@research_service_activity.type_caption.downcase} dengan judul <b>#{@research_service_activity.title}</b> yang akan dilaksanakan pada hari <b>#{datetime_to_string @research_service_activity.implementation_at, :long}</b> di <b>#{@research_service_activity.company_title}</b> maka melalui surat ini Lembaga Penelitian dan Pengabdian kepada Masyarakat Universitas Prima Indonesia menugaskan kepada:", align: :justify, inline_format: true

    move_down 10
    table lecturer_table + member_table, width: bounds.width do
      row(0).font_style = :bold
      row(0).align = :center
      column(0).width = 30
      column(0).align = :center
      column(2).align = :center
    end

    move_down 20
    text "Agar dapat melaksanakan kegiatan tersebut di atas dengan sebaik - baiknya dan penuh tanggung jawab.", align: :justify

    move_down 10
    text "Demikian surat penugasan ini diberikan agar dapat digunakan sebagaimana mestinya, atas perhatian dan kerjasama, kami ucapkan terima kasih.", :align => :justify
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

  def number_table
    [
      [{ content: 'Nomor'}, { content: ':'}, { content: @research_service_activity.assignment_certificate_number }],
      [{ content: 'Perihal'}, { content: ':'}, { content: "Surat Penugasan #{@research_service_activity.type_caption}" }]
    ]
  end

  def contact_table
    [
      [{ content: 'Yth.'}, { content: @research_service_activity.company_contact_caption }],
      [{ content: ''}, { content: "Pimpinan #{@research_service_activity.company_title}" }]
    ]
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
