class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @q = Student.all.ransack(params[:q])
    @students = @q.result(distinct: true).page(params[:page]).per(10)

    respond_to do |format|
        format.html
        format.csv {send_data @students.generate_csv, filename: "students-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def show
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

  private def student_params
      params.require(:student).permit(:name, :kana, :email, :birthdate, :school, :memo)
  end

  private def set_student
    @student = Student.find(params[:id])
  end
end
