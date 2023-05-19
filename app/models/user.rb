class User < ApplicationRecord
    has_secure_password

    has_many :jobs
    has_many :reviews
    has_many :applies
    has_many :applications, through: :applies, source: :job
    has_many :likes, dependent: :destroy
    has_many :liked_jobs, through: :likes, source: :job

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: {message: "Email should be unique", case_sensitive: false}
end
