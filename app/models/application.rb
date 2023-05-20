class Application < ApplicationRecord
    belongs_to :user
    belongs_to :Job
    has_many :application_statuses
    has_many :statuses, through: :application_statuses

    def current_status
        statuses.last
    end
end
