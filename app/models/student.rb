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

    def self.csv_attributes
        ["id", "name", "kana", "email", "birthdate", "school", "memo", "created_at", "updated_at"]
    end

    def self.generate_csv
        bom = "\uFEFF"
        CSV.generate(bom, headers: true) do |csv|
            csv << csv_attributes
            all.each do |student|
            csv << csv_attributes.map{|attr| student.send(attr)}
            end
        end
    end

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            student = Student.new
            student.attributes = row.to_hash.slice(*csv_attributes)
            student.save!(validate: false)
        end
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[id kana school birthdate subject]
    end

    # def self.ransackable_associations(auth_object = nil)
    #     []
    # end
end
