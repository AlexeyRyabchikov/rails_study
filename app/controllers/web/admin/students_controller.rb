class Web::Admin::StudentsController < Web::Admin::ApplicationController
  def index
    @search = Student.ransack(params[:q])
    @pagy, @students = pagy(@search.result)
  end

  def new
    @student = Student.new
    authorize @student
  end

  def create
    @student = Student.new(student_attrs)

    if @student.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @student = Student.find(params[:id]).decorate
  end

  def edit
    @student = Student.find(params[:id])
    authorize @student
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    student = Student.find(params[:student_id])
    student.del!
    redirect_to action: :index
  end

  def restore
    student = Student.find(params[:student_id])
    student.restore!
    redirect_to action: :index
  end

  private

  def student_attrs
    params.require(:student).permit(:first_name, :last_name, :email, :phone_number, :photo)
  end
end
