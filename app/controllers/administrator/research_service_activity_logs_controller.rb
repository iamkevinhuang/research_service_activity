class Administrator::ResearchServiceActivityLogsController < ApplicationController

	layout 'administrator'
	before_filter :administrator_login_required
	before_filter :check_status

	def new
		@research_service_activity_last_log = @research_service_activity.logs.last
		@research_service_activity_log = @research_service_activity.logs.new
	end

	def create
		@research_service_activity_last_log = @research_service_activity.logs.last
		@research_service_activity_log = @research_service_activity.logs.build params[:research_service_activity_log]
		@research_service_activity_log.administrator_id = current_administrator.id

		if @research_service_activity_log.save

      @research_service_activity = ResearchServiceActivity.find params[:research_service_activity_id]
			@research_service_activity.compile_request_certificate! if @research_service_activity_log.status_id == 7
			@research_service_activity.compile_assignment_certificate! if @research_service_activity_log.status_id == 11
			@research_service_activity.compile_report_certificate! if @research_service_activity_log.status_id == 19

			redirect_to administrator_research_service_activities_path, notice: 'Status kegiatan berhasil diperbaharui!'
		else
			flash[:alert] = @research_service_activity_log.errors.full_messages.first
			render :new
		end
	end

	private

  def check_status
    @research_service_activity = ResearchServiceActivity.find params[:research_service_activity_id]

    unless current_administrator.programs.include? @research_service_activity.program_id.to_s
      redirect_to administrator_research_service_activities_path, alert: "Maaf, Anda tidak mempunyai hak program studi untuk mengakses kegiatan ini!" and return
    end

    flag = false
    case @research_service_activity.status_id
    when 1, 13
      flag = true unless administrator_role_check? ['ketua_program_studi','sekretaris_program_studi']
    when 3, 15
      flag = true unless administrator_role_check? ['dekan','wakil_dekan']
    when 5, 9, 17
      flag = true unless administrator_role_check? ['lembaga_penelitian_dan_pengabdian_masyarakat']
    else
      flag = true
    end

    if flag
      redirect_to administrator_research_service_activities_path, alert: "Maaf, Anda tidak mempunyai hak peran untuk mengakses kegiatan ini!" and return
    end

  end

end

