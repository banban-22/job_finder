class HomeController < ApplicationController
    def index
        if params[:q].present?
            @q = params[:q]
            @jobs = Job.search(@q)
        else
            @q = ""
            @jobs = Job.all.order(created_at: :desc)
        end
    end
end
