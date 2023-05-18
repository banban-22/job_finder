class ApplyController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create]

    def index
        @apply = current_user.apply.all.order(created_at: :desc)
    end

    def create
        @apply = Apply.new
        @apply.user = current_user
        @apply.job = Job.find params[:job_id]
        if @apply.save
            redirect_to jobs_path, notice: "Applied!"
        else
            redirect_to jobs_path, alert: "You already applied!"
        end
    end
end
