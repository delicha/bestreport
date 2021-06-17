class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :cal_birth, only: [:show]

  def index
    @q = Student.ransack(params[:q])
    if current_user.name == 'オーナー'
      @students = @q.result(distinct: true).page(params[:page]).per(100).order('kana ASC')
    else
      @students = @q.result(distinct: true).page(params[:page]).per(5).order('kana ASC')
    end

    respond_to do |format|
      format.html
      format.csv {send_data @students.generate_csv, filename: "students-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def show
    @birth = cal_birth
    # @q = @student.reports.ransack(params[:q])
    @q = Report.where(:user_id == @student).ransack(params[:q])
    @reports = @q.result(distinct: true).page(params[:page]).per(5).order('created_at DESC')
    
    
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to student_path(@student), notice: "生徒「#{@student.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to student_path(@student), notice: "生徒「#{@student.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: "生徒「#{@student.name}」を削除しました。"
  end

  def import
    Student.import(params[:file])
    redirect_to students_url, notice: "生徒を追加しました。"
  end

  private def student_params
    params.require(:student).permit(:name, :kana, :email, :birthdate, :school, :memo)
  end

  private def set_student
    @student = Student.find(params[:id])
  end

  private def cal_birth
    @birth = @student.birthdate.to_s
    birthday = Date.parse(@birth) 
    today = Date.today
    toDate = Time.mktime(today.year - (today.month < 4 ? 1 : 0), 4, 1)
    @age = (toDate.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
  end
end
