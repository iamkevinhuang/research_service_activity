class AdministratorSessionsController < ApplicationController

  layout 'administrator'

  before_filter :administrator_login_required, :only => :destroy

  def new
    redirect_to administrator_pages_home_path if current_administrator
  end

  def create
    case params[:step]
    when '1' then
      @administrator = Administrator.find_by_login params[:login]
      if @administrator.nil?
        flash.now[:alert] = 'Login gagal!'
        render :new
      elsif @administrator.status_id == 0
        flash.now[:alert] = 'Maaf, status login Anda tidak aktif.'
        render :new
      else
        @administrator.update_attributes(:password2_sample => (1..8).to_a.sample(3).join) if @administrator.password2_sample.nil?
        @login = params[:login]
      end
    when '2' then
      administrator = Administrator.authenticate(params[:login], params[:password1], params[:password2])
      if administrator
        administrator.update_attributes(:password2_sample => nil)
        administrator.histories.create(
          :remote_ip => request.remote_ip,
          :controller => params[:controller],
          :action => params[:action]
        )
        session[:administrator_id] = administrator.id
        redirect_to administrator_pages_home_path, :notice => 'Login sukses!'
      else
        @administrator = Administrator.find_by_login params[:login]
        @login = params[:login]
        flash.now[:alert] = 'Kata kunci tidak valid!'
        render :action => 'create'
      end
    end
  end

  def destroy
    session[:administrator_id] = nil
    redirect_to administrator_login_path, :alert => 'Logout berhasil!'
  end

end
