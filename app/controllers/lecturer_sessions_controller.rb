class LecturerSessionsController < ApplicationController

  layout 'lecturer'

  before_filter :generate_variables
  before_filter :lecturer_login_required, only: :destroy

  def new
    redirect_to lecturer_pages_home_path if current_lecturer
  end

  def create
    lecturer = Lecturer.authenticate params[:email], params[:password]
    if lecturer
      session[:lecturer_id] = lecturer.id
      redirect_to lecturer_pages_home_path, :notice => 'Login Sukses'
    else
      flash.now[:alert] = 'Email atau Kata Kunci tidak valid!'
      render action: 'new'
    end
  end

  def destroy
    session[:lecturer_id] = nil
    flash[:notice] = 'Anda sudah logout.'
    redirect_to lecturer_login_path
  end

  private

  def generate_variables
    @posts = Post.ten_latest_posts
  end

end
