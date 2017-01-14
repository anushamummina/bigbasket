class Users::SessionsController < Devise::SessionsController

	def new
		@roles = Role.all
		super
	end

end