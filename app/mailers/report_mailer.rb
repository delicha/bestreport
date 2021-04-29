class ReportMailer < ApplicationMailer
    default from: 'provisioninc@outlook.jp'

    def creation_email(report)
        @report = report
        mail(subject: '個人指導報告書', to: @report.student.email) do |format|
            format.text #テキストメールを指定
        end
    end
end