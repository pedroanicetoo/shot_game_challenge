class LogsController < ApplicationController
  def new
    @log = Log.new
  end

  def create
    action = LogService::CreateLog.call(params[:log][:log_file]) if params[:log] && params[:log][:log_file]
    if action
      flash[:success] = "Log successfully created"
      flash[:log_line] = action
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      redirect_to root_path
    end
  end
end
