class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @applications = current_user.applications.order(created_at: :desc)
  end

  def new
    @job = Job.find(params[:job_id])
    @application = @job.applications.new
  end

  def create
    @job = Job.find(params[:job_id])
    @application = @job.applications.new(application_params)
    @application.user = current_user
    @application.statuses << Status.find_by(status: "Pending")

    if @application.save
      redirect_to @job, notice: 'Application was successfully created.'
    else
      render :new
    end

    private
    
    def application_params
      params.require(:application).permit(:job_id)
    end
  end

  # def index 
  #   @applications = @job.applications.order(created_at: :desc)
  # end

  # def new
  #   @job = Job.find(params[:job_id])
  #   @application = @job.applications.new
  # end

  # def create
  #   @job = Job.find(params[:job_id])
  #   @application = @job.applications.new(application_params)
  #   @application.user = current_user
  #   @application.status = "Pending"

  #   if @application.save
  #     redirect_to @job, notice: 'Application was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @job = Job.find(params[:job_id])
  #   @application = @job.applications.find(params[:id])

  #   if can?(:edit, @application)
  #     if @application.update(application_params)
  #       redirect_to job_path(@job), notice: 'Application status was successfully updated.'
  #     else
  #       render :edit
  #     end
  #   else
  #     redirect_to job_path(@job), alert: 'Not Authorized'
  #   end
  # end

  # def show
  #   @job = Job.find(params[:job_id])
  #   @application = @job.applications.find(params[:id])
  # end

  # private

  # def application_params
  #   params.require(:application).permit(:status, :job_id, :user_id)
  # end
end
