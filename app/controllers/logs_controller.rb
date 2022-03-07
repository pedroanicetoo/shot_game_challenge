# frozen_string_literal: true

class LogsController < ApplicationController

  def new
    @matches = Match.all
    @log = Log.new
  end

  def create
    action = LogService::CreateLog.call(params[:log][:log_file]) if params[:log] && params[:log][:log_file]
    if action
      flash[:success] = "Log successfully created"
      flash[:log_line] = action
      redirect_to new_log_path
    else
      flash[:error] = "Something went wrong"
      redirect_to new_log_path
    end
  rescue ArgumentError => e
    flash[:error] = e.message
    redirect_to new_log_path
  end

end
