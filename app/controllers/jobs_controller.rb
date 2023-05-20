class JobsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :authorize_recruiter!, only: [:new, :create, :edit, :update, :destroy]

    def index
        if params[:q].present?
            @q = params[:q]
            @jobs = Job.search(@q)
        else
            @q = ""
            @jobs = Job.all
        end
    end

    def show
        @job = Job.find(params[:id])
        @review = Review.new
        @reviews = @job.reviews
        @like = @job.likes.find_by(user: current_user)
    end

    def new
        @job = Job.new
        @applications = Application.order(created_at: :desc)
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
    end

    def update
        @job = Job.find(params[:id])
        if @job.update job_params
            redirect_to job_path(@job)
        else
            render :edit
        end
    end

    def destroy
        @job = Job.find(params[:id])
        @job.destroy
        redirect_to jobs_path
    end

    def authorize!
        redirect_to root_path, alert: "Not Authorized" unless can?(:crud, @job)
    end

    def liked
        @jobs = current_user.liked_jobs.order(created_at: :desc)
    end

    private
    def job_params
        params.require(:job).permit(:title, :description, :company, :location)
    end

    def authorize_recruiter!
        unless current_user.is_recruiter? || current_user.is_admin?
        redirect_to root_path, alert: "You are not authorized to perform this action."
        end
    end
end
