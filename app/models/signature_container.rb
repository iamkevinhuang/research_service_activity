class SignatureContainer < ActiveRecord::Base

  attr_accessor :title, :number, :link

  def compile!
    case self.model_name
    when 'ResearchServiceActivity'

      research_service_activity = ResearchServiceActivity.find self.model_id
      case self.sha_id
      when research_service_activity.request_sha_id

        self.title = "Surat Permohona Kegiatan #{research_service_activity.type_caption}"
        self.number = research_service_activity.request_certificate_number
        self.link = research_service_activity.request_certificate.url

      when research_service_activity.assignment_sha_id

        self.title = "Surat Penugasan Kegiatan #{research_service_activity.type_caption}"
        self.number = research_service_activity.assignment_certificate_number
        self.link = research_service_activity.assignment_certificate.url

      when research_service_activity.report_sha_id

        self.title = "Surat Pelaporan Kegiatan #{research_service_activity.type_caption}"
        self.number = research_service_activity.report_certificate_number
        self.link = research_service_activity.report_certificate.url

      end
    end
  end

end
