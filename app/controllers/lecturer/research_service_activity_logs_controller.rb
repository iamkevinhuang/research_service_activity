class Lecturer::ResearchServiceActivityLogsController < ApplicationController

	layout 'administrator'
	before_filter :lecturer_login_required
	before_filter :check_status

	def new
		@research_service_activity_last_log = @research_service_activity.logs.last
		@research_service_activity_log = @research_service_activity.logs.new
	end

	def create
		@research_service_activity_last_log = @research_service_activity.logs.last
		@research_service_activity_log = @research_service_activity.logs.build params[:research_service_activity_log]
		@research_service_activity_log.lecturer_id = current_lecturer.id

		if @research_service_activity_log.save
			redirect_to lecturer_research_service_activity_path(@research_service_activity), notice: 'Status Pemohonan berhasil diperbaharui!'
		else
			flash[:alert] = @research_service_activity_log.errors.full_messages.first
			render :new
		end
	end

	private

  def check_status
    @research_service_activity = ResearchServiceActivity.find params[:research_service_activity_id]
#   @research_service_activity.members.each do |member|
#     if member.status_id == 0
#       redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Masih ada anggota yang mempunyai status Diajukan !" and return
#     end
#   end

#   unless @research_service_activity.status_id == 0 || (@research_service_activity.status_id == 8 && @research_service_activity.company_reply_file.exists?) || @research_service_activity.status_id == 12

#     if (@research_service_activity.status_id == 8 && !@research_service_activity.company_reply_file.exists?)
#       redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Surat Balasan Perusahaan belum di upload!" and return

#     else
#       redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Perubahan status telah diajukan sebelumnya!" and return
#     end
#   end

#   if @research_service_activity.status_id == 12
#     if @research_service_activity.type_id == 1 && !@research_service_activity.output_id
#       redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Anda  belum memilih Hasil Output!" and return
#     end

#     if !@research_service_activity.publisher_category_id
#       redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Anda  belum memilih Kategori Penerbit!" and return
#     end

#     if @research_service_activity.publisher_name.to_s.length == 0
#       redirect_to lecturer_research_service_activity_path(@research_service_activity), :alert => "Anda  belum memasukkan nama penerbit!" and return
#     end
#   end
  end

end

