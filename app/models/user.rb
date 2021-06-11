class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    validates :subject, presence: true, length: { maximum: 30 }
    validates :password, presence: true, length: { minimum: 4 }
    validates :password_confirmation, presence: true

    has_secure_password
    has_many :reports, dependent: :destroy
    has_many :students, through: :reports

    def self.ransackable_attributes(auth_object = nil)
        %w[name subject created_at]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end

end
