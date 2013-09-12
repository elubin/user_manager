class UsersController < ApplicationController

  def index
    @users = User.order('name')
  end

  def create
    User.create params[:user]
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
    @direct_reports = @user.manages.pluck(:direct_report_id)
    @all_users = User.where("id != ?", params[:id])

  end

  def update
    u = User.find(params[:id])
    u.update_attributes params[:user]

    direct_reports = params[:manager]

    u.manages.destroy_all
    direct_reports[:direct_report_id].each do |m|
      u.manages.create(direct_report_id: m) if !m.blank?
    end

    redirect_to users_path
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end


end

