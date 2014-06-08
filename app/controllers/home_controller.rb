class HomeController < ApplicationController
	def index
		@users = User.all
		@user = current_user
		@projects = Project.all
	end
end
