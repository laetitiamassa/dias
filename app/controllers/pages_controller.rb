class PagesController < ApplicationController
	before_filter :authenticate_user!, only: [:membership]

	def about
	end

	def faq
	end

	def team
	end

	def partners
	end

	def manifesto
	end

	def membership
	end
	
end
