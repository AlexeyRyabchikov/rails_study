module Support
  module Auth
    def sign_in_as_admin(admin)
      post admin_session_path, params: { admin: { email: admin.email, password: admin.password } }
    end
  end
end