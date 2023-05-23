class User < ApplicationRecord
    has_secure_password

    has_many :jobs
    has_many :reviews
    has_many :applies, dependent: :destroy
    has_many :applications, through: :jobs, source: :applies
    has_many :likes, dependent: :destroy
    has_many :liked_jobs, through: :likes, source: :job

    has_one_attached :resume

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: {message: "Email should be unique", case_sensitive: false}

    def full_name
        "#{first_name} #{last_name}"
    end
end
