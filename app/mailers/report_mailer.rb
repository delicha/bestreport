class ReportMailer < ApplicationMailer
    default from: 'provisioninc@outlook.jp'
    
    def creation_email(report)
        @report = report
        mail(
            subject: '報告書作成完了メール',
            to: 'shoheiyamamoto919@gmail.com'
        )
    end
end
