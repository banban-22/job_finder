class User < ApplicationRecord
    has_secure_password

    has_many :jobs
    has_many :reviews
    has_many :apply
    has_many :applications, through: :apply, source: :job

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: {message: "Email should be unique", case_sensitive: false}
end
