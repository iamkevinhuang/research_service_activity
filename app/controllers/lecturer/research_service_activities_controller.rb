class Lecturer::ResearchServiceActivitiesController < ApplicationController

	layout 'lecturer'
	before_filter :lecturer_login_required
	before_filter :before_edit, only: [ :edit, :update ]
	before_filter :before_show, only: [ :show ]


	def index
    @research_service_activities = current_lecturer.research_service_activities.order 'research_service_activities.id desc'

		@research_service_activity_from_members = ResearchServiceActivityMember.where 'lecturer_id = ?', current_lecturer.id
		@research_service_activity_from_members = @research_service_activity_from_members.where 'status_id = 1'

		@research_service_activity_from_members.each do |member|
			activity = member.research_service_activity
			@research_service_activities.append(activity)
		end
	end

	def new
		@research_service_activity = ResearchServiceActivity.new
    @research_service_activity.program_id = current_lecturer.current_program_id
	end

	def create
    research_service_activities = current_lecturer.research_service_activities.where 'research_service_activities.status_id <> 19'
    redirect_to(lecturer_research_service_activities_path, alert: 'Maksimum hanya 3 kegiatan aktif yang diperbolehkan dalam satu saat!' ) and return if research_service_activities.size > 3


		@research_service_activity = ResearchServiceActivity.new params[:research_service_activity]
		@research_service_activity.lecturer_id = current_lecturer.id

		if @research_service_activity.save
			@research_service_activity_log = ResearchServiceActivityLog.new
			@research_service_activity_log.research_service_activity_id = @research_service_activity.id
			@research_service_activity_log.status_id = 0
			@research_service_activity_log.note = 'Membuat Permohonan Baru.'
			@research_service_activity_log.lecturer_id = current_lecturer.id
			@research_service_activity_log.save

			redirect_to lecturer_research_service_activity_path(@research_service_activity), notice: 'Pemohonan Berhasil ditambahkan!'
		else
			render 'new'
		end
	end

	def edit
		unless @research_service_activity.lecturer_id == current_lecturer.id
			redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Hanya Ketua Peneliti yang bisa mengubah Data Penelitian !"
		end
	end

	def update
		
		if @research_service_activity.update_attributes params[:research_service_activity]
      redirect_to lecturer_research_service_activity_path(@research_service_activity), notice: 'Pengisian berhasil diperbaharui!'
		else
      flash[:alert] = @research_service_activity.errors.full_messages.first
			render 'edit'
		end
	end

	def show
    @research_service_activity_last_log = @research_service_activity.logs.last
	end

	def logs
		@research_service_activity = ResearchServiceActivity.find params[:id]
		@logs = @research_service_activity.logs
	end

  def reset
		@research_service_activity = ResearchServiceActivity.find params[:id]
    @research_service_activity.reset!
    redirect_to lecturer_research_service_activity_path(@research_service_activity), notice: 'Status berhasil diubah!'
  end

	def draft_request
		@research_service_activity = ResearchServiceActivity.find params[:id]

    if [2,4,6].include? @research_service_activity.status_id
			@research_service_activity.back_to_draft_request!
			redirect_to lecturer_research_service_activity_path(@research_service_activity), notice: 'Status berhasil diubah!'
		else
			redirect_to lecturer_research_service_activity_path(@research_service_activity), alert: 'Maaf, status permohonan tidak dapat diubah!'
		end
	end 

	def draft_assignment
		@research_service_activity = ResearchServiceActivity.find params[:id]

    if [7,10].include? @research_service_activity.status_id
			@research_service_activity.back_to_draft_assignment!
			redirect_to lecturer_research_service_activity_path(@research_service_activity), notice: 'Status berhasil diubah!'
		else
			redirect_to lecturer_research_service_activity_path(@research_service_activity), alert: 'Maaf, status permohonan tidak dapat diubah!'
		end
	end

	def draft_report
		@research_service_activity = ResearchServiceActivity.find params[:id]

    if [11,14,16,18].include? @research_service_activity.status_id
			@research_service_activity.back_to_draft_report!
			redirect_to lecturer_research_service_activity_path(@research_service_activity), notice: 'Status berhasil diubah!'
		else
			redirect_to lecturer_research_service_activity_path(@research_service_activity), alert: 'Maaf, status permohonan tidak dapat diubah!'
		end
	end

	private

  def before_edit
    @research_service_activity = ResearchServiceActivity.find params[:id]

    unless @research_service_activity.status_id == 0 || @research_service_activity.status_id == 8 || @research_service_activity.status_id == 12
      redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Saat ini anda sudah tidak dapat mengganti informasi pemohonan lagi !"
    end
  end

  def before_show
    @research_service_activity = ResearchServiceActivity.find params[:id]

    allow = @research_service_activity.lecturer_id == current_lecturer.id 

    unless allow
      @members = @research_service_activity.members.where 'status_id = 1'

      @members.each do |member|
        if member.lecturer_id == current_lecturer.id
          allow = true
          break
        end
      end
    end

    unless allow
      redirect_to lecturer_research_service_activities_path, :alert => "Anda tidak berhak mengakses permohonan ini !"
    end
  end

end

