class StatusesController < ApplicationController
    before_action :authenticate_user!

    def update
        @application = Application.find(params[:application_id])
        @status = Status.find(params[:id])
        @application.statuses << @status

        redirect_to @application.job, notice: 'Application status was successfully updated.'
    end
end
