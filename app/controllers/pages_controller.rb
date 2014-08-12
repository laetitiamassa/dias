class PagesController < ApplicationController
	before_filter :authenticate_user!, only: [:membership]

	def about
		@user = current_user
	end

	def faq
		@user = current_user
	end

	def team
	end

	def partners
	end

	def manifesto
		@user = current_user
	end

	def membership
	end

	def fonctionnement
		@user = current_user
	end
	
end
