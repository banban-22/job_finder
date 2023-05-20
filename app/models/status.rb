class Status < ApplicationRecord
    has_many :application_statuses
    has_many :applications, through: :application_statuses
end
