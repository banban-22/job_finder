class JobsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @jobs = Job.all.order(created_at: :desc)
    end

    def show
        @job = Job.find(params[:id])
        @review = Review.new
    end

    def new
        @job = Job.new
    end

    def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
        redirect_to @job, notice: 'Job was successfully created.'
    else
        render :new
    end
    end

    def edit
        @job = Job.find(params[:id])
        if can?(:edit, @job) == false
            redirect_to root_path, alert: 'User Not Authorized!'
        end
    end

    def update
        @job = Job.find(params[:id])

        if can?(:edit, @job) == false
            redirect_to root_path, alert: 'User Not Authorized!'
        elsif @job.update(job_params)
            redirect_to job_path(@job)
        else
            render :edit
        end
    end

    def destroy
        @job = Job.find(params[:id])

        if can?(:delete, @job) == false
            redirect_to root_path, alert: 'User Not Authorized!'
        else
            @job.destroy
            redirect_to jobs_path
        end
    end

    private
    def job_params
        params.require(:job).permit(:title, :description, :company, :location)
    end
end
