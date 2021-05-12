class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy, :mailsend]
  before_action :set_student_in_report

  def index
    @q = Report.all.ransack(params[:q])
    @reports = @q.result(distinct: true).page(params[:page]).per(10).order(id: :DESC)

    respond_to do |format|
        format.html
        format.csv {send_data @reports.generate_csv, filename: "reports-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def show
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = Report.new(report_params.merge(user_id: current_user.id))

    if @report.save
      redirect_to reports_url, notice: "報告書「#{@report.id}」を登録しました。"
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      if @report.mailsend == true
        ReportMailer.creation_email(@report).deliver_now
        redirect_to reports_url, notice: "報告書「#{@report.id}」を送信しました。"
      else
        redirect_to reports_url, notice: "報告書「#{@report.id}」を更新しました。"
      end
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: "報告書「#{@report.id}」を削除しました。"
  end

  def unsent
    @q = Report.all.where(mailsend: false).all.ransack(params[:q])
    @reports = @q.result(distinct: true).page(params[:page]).per(10).order(id: :DESC)
  end

  def import
    Report.import(params[:file])
    redirect_to reports_url, notice: "報告書を追加しました。"
  end

  private def report_params
    params.require(:report).permit(:student_id, :kind, :subject, :description, :attendance, :unit_name, :page, :homework, :performance, :minitest, :nexthw, :comment, :other, :credit, :mailsend, :user_id)
  end

  private def set_report
    @report = Report.find(params[:id])
    # @report = current_user.reports.find(params[:id])
  end

  private def set_student_in_report
    @id = params[:student_id]
    @student = Student.find_by(id: @id)
  end
end
