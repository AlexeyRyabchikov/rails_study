class Web::Student::SessionsController < Web::Student::ApplicationController
    skip_before_action :authenticate_student!, only: %i[new create]
    def new; end
  
    def create
      student = Student.find_by(email: params[:student][:email])
      if student&.authenticate(params[:student][:password])
        student_sign_in(student)
        redirect_to student_root_path
      else
        render action: :new
      end
    end
  
    def destroy
      student_sign_out
      redirect_to new_student_session_path
    end
  end