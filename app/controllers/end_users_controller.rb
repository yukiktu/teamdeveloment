class EndUsersController < ApplicationController

# before_action :authenticate_end_user!

	def index
	end

	def show
		@end_user = current_end_user
	end

end
