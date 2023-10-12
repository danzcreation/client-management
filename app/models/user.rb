class User < ApplicationRecord
    include ActiveModel::SecurePassword

    has_secure_password
    enum :kind, admin: "admin", account_manager: "account_manager"

    validates :email, presence: true, uniqueness: true
    validates :password, :kind, presence: true
end
