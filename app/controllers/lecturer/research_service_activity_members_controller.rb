class Lecturer::ResearchServiceActivityMembersController < ApplicationController

	layout 'lecturer'
	before_filter :lecturer_login_required
	before_filter :before_edit, only: [ :edit, :update ]

	def index
		@research_service_activity_members = ResearchServiceActivityMember.where 'lecturer_id = ?', current_lecturer.id
		@research_service_activity_members = @research_service_activity_members.where 'status_id = 0'
	end

	def new
		@research_service_activity = ResearchServiceActivity.find params[:research_service_activity_id]
    	@research_service_activity_last_log = @research_service_activity.logs.last
		check_status @research_service_activity
		@research_service_activity_member = ResearchServiceActivityMember.new
	end

	def create
		@research_service_activity_member = ResearchServiceActivityMember.new params[:research_service_activity_member]
		@research_service_activity = @research_service_activity_member.research_service_activity

		check_status @research_service_activity

		position_checker = ResearchServiceActivityMember.where 'research_service_activity_id = ?', @research_service_activity.id
		position_checker = position_checker.where 'position_id = ?', @research_service_activity_member.position_id

		if @research_service_activity_member.lecturer_id == nil
			redirect_to new_lecturer_research_service_activity_member_path(research_service_activity_id: @research_service_activity, type_of_lecturer: @research_service_activity_member.lecturer_id), alert: "Anggota wajib di pilih berdasarkan list !" 
		elsif position_checker.size > 0
			redirect_to new_lecturer_research_service_activity_member_path(research_service_activity_id: @research_service_activity, type_of_lecturer: @research_service_activity_member.lecturer_id), alert: "Posisi ke #{@research_service_activity_member.position_id} sudah terisi oleh dosen lain !" 
		elsif @research_service_activity_member.save
			redirect_to lecturer_research_service_activity_path(@research_service_activity_member.research_service_activity), notice: "Anggota berhasil ditambahkan !" 
		else
			@research_service_activity_last_log = @research_service_activity.logs.last
			render 'new'
		end
	end

	def edit
    	@research_service_activity_last_log = @research_service_activity.logs.last

		unless @research_service_activity.lecturer_id == current_lecturer.id
			redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Hanya Ketua Peneliti yang bisa mengubah Anggota !"
		end
	end

	def show
		@research_service_activity_member = ResearchServiceActivityMember.find params[:id]

		if @research_service_activity_member.lecturer_id != current_lecturer.id || @research_service_activity_member.status_id != 0
			redirect_to lecturer_research_service_activity_members_path, :alert => "Anda tidak berhak mengakses halaman ini !"
		end
	end

	def update
		if @research_service_activity_member.update_attributes(params[:research_service_activity_member])
			redirect_to lecturer_research_service_activity_path(@research_service_activity_member.research_service_activity), notice: "Anggota berhasil diubah !" 
		else
			@research_service_activity_last_log = @research_service_activity.logs.last
			render 'edit'
		end
	end

	def agree
		@research_service_activity_member = ResearchServiceActivityMember.find params[:id]
		@research_service_activity_member.agree!
		redirect_to lecturer_research_service_activity_path(@research_service_activity_member.research_service_activity), :notice => "Berhasil di terima !"
	end

	def reject
		@research_service_activity_member = ResearchServiceActivityMember.find params[:id]
		@research_service_activity_member.reject!
		redirect_to lecturer_research_service_activity_members_path, :notice => "Berhasil di tolak !"
	end

	private
		def check_status activity
			unless activity.status_id == 0
				redirect_to lecturer_research_service_activity_path(activity), :alert => "Saat ini anda sudah tidak dapat menambahkan anggota !" and return
			end

			unless activity.lecturer_id == current_lecturer.id
				redirect_to lecturer_research_service_activity_path(activity), :alert => "Hanya Ketua Peneliti yang bisa menambah Anggota !" and return
			end
		end

		def before_edit
			@research_service_activity_member = ResearchServiceActivityMember.find params[:id]
			@research_service_activity = @research_service_activity_member.research_service_activity

			unless @research_service_activity.status_id == 0
				redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Saat ini anda sudah tidak dapat mengubah anggota !" and return
			end
		end

end

