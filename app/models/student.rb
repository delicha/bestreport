class Student < ApplicationRecord
    before_save { self.email = email.downcase }

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    validates :school, presence: true, length: { maximum: 30 } 
    validates :birthdate, presence: true, length: { maximum: 20 }

    has_many :reports, dependent: :destroy

    default_scope -> {order(created_at: :desc)}
end
