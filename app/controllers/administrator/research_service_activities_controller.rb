class Administrator::ResearchServiceActivitiesController < ApplicationController

	layout 'administrator'
	before_filter :administrator_login_required
	before_filter :check_status, only: :show

	def index
    statuses = []
    statuses += [1,13] if administrator_role_check? ['ketua_program_studi', 'sekretaris_program_studi']
    statuses += [3,15] if administrator_role_check? ['dekan', 'wakil_dekan']
    statuses += [5,9,17] if administrator_role_check? ['lembaga_penelitian_dan_pengabdian_masyarakat']
    @research_service_activities = ResearchServiceActivity.on_progress current_administrator.programs, statuses
	end

	def show
    @research_service_activity_last_log = @research_service_activity.logs.last
	end

	def change_program
		if current_administrator.programs.include? params[:program_id]
	      current_administrator.update_attributes current_program_id: params[:program_id]
	    end
	    redirect_to administrator_research_service_activitys_path
	end

	def logs
		@research_service_activity = ResearchServiceActivity.find params[:id]
		@logs = @research_service_activity.logs
	end

	private

  def check_status

    @research_service_activity = ResearchServiceActivity.find params[:id]

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

