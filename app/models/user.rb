class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, :email_address, :password, presence: true, length: { minimum: 2 }
    validates :email_address, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
