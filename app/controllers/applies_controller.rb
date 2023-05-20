class AppliesController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create]

    def index
        @applies = current_user.applies.all.order(created_at: :desc)
    end

    def create
        @applies = Apply.new
        @applies.user = current_user
        @applies.job = Job.find params[:job_id]
        if @applies.save
            redirect_to jobs_path, notice: "Applied!"
        else
            redirect_to jobs_path, alert: "You already applied!"
        end
    end
end
