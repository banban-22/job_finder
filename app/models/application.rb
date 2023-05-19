class Application < ApplicationRecord
    belongs_to :user
    belongs_to :job, foreign_key: 'job_id'
end
