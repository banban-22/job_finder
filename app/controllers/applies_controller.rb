class AppliesController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create]

    def index
        @applies = current_user.applies.all.order(created_at: :desc)
    end

    def create
        @job = Job.find params[:job_id]
        @apply = @job.applies.build(user: current_user)
        @applies = Apply.new
        @applies.user = current_user
        @applies.job = Job.find params[:job_id]

        if @applies.save
            ResponsesMailer.new_apply(@apply).deliver_now if @apply.persisted?
            redirect_to jobs_path, notice: "Your Application submitted successfully!"
        else
            redirect_to jobs_path, alert: "You already applied!"
        end
    end
end
