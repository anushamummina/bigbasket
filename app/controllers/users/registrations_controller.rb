class Users::RegistrationsController < Devise::RegistrationsController

	def new
		@roles = Role.all
		super
	end

	private

  def sign_up_params
    params.require(:user).permit(:name, :phone_number, :email, :password, :password_confirmation, :role_id)
  end

  # def account_update_params
    # params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  # end
end