class ReviewsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

def new
  @job = Job.find(params[:job_id])
  @review = Review.new
end

def create
  @job = Job.find(params[:job_id])
  review_params = params.require(:review).permit(:title, :content, :job_title, :location, :is_current, :rating)
  @review = @job.reviews.new(review_params)
  @review.job = @job
  @review.user = current_user

  if @review.save
    ResponsesMailer.new_review(@review).deliver_now
    redirect_to job_path(@job), notice: 'Review created!'
  else
    render '/jobs/show'
  end
end

    def destroy
        @job = Job.find(params[:job_id])
        @review = Review.find(params[:id])

        puts "Job ID: #{params[:job_id]}"
        puts "Review ID: #{params[:id]}"

        if can?(:delete, @review) == false
            redirect_to root_path, alert: 'User Not Authorized!'
        else
            @review.destroy
            redirect_to job_path(@job), notice: 'Review deleted Successfully!'
        end
    end
end