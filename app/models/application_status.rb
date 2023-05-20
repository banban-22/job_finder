class ApplicationStatus < ApplicationRecord
    belongs_to :application
    belongs_to :status
end
