class Report < ApplicationRecord

    validates :kind, presence: true
    validates :subject, presence: true
    validates :attendance, presence: true
    validates :homework, presence: true
    validates :performance, presence: true
    validates :comment, presence: true

    belongs_to :user
    belongs_to :student

    def self.csv_attributes
        ["id", "kind", "subject", "description", "attendance", "homework", "performance", "minitest", "comment", "other", "credit", "created_at", "updated_at", "user_id", "student_id"]
    end

    def self.generate_csv
    bom = "\uFEFF"
        CSV.generate(bom, headers: true) do |csv|
            csv << csv_attributes
            all.each do |report|
            csv << csv_attributes.map{|attr| report.send(attr)}
            end
        end
    end

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            report = Report.new
            report.attributes = row.to_hash.slice(*csv_attributes)
            report.save!(validate: false)
        end
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[id subject comment created_at]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
