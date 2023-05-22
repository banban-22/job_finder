class ResponsesMailer < ApplicationMailer
    def new_review(review)
        @review = review
        @job = review.job
        @owner = @job.user
        mail(to: @owner.email, subject: "You got an review!")
    end

    def new_apply(apply)
        @apply = apply
        @job = apply.job
        @owner = @job.user
        mail(to: @owner.email, subject: "You got a new application!")
    end
end