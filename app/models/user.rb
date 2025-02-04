class User < ApplicationRecord
    has_secure_password
    has_rich_text :notes
    ROLES = %w[admin user guest].freeze

    validates :name, presence: true, length: { minimum: 5, maximum: 15 }
    validates :password, presence: true, length: { minimum: 8, maximum: 20 }, confirmation: { case_sensitive: true }, unless: -> { password.blank? }
    validates :password_confirmation, presence: true, length: { minimum: 8, maximum: 20 }, unless: -> { password.blank}
    validates :gender, presence: true
    validates :birthdate, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true, length: { minimum: 10, maximum: 15 }
    validates :postalcode, presence: true, length: { minimum: 5, maximum: 10 }
    validates :websiteurl, presence: true, format: { with: URI::regexp(%w(http https)) }, message: "must be a valid URL"
    validates :termsandconditions, acceptance: { message: "must be accepted" }
    validates :role, presence: true, inlcusion: { in: ROLES, message: "is not a valid role" }
    validates :notes, length: { maximum: 500 }
    
end
