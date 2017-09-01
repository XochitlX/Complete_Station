class MedicinesController < ApplicationController
	def start
		p "dentro start Medicineeee" * 20
	end

	def create
		p "CREATE Medicine ***********" *20
		p params
		#guardar parametros de medicina
	end

	def option
		p "OPTION " *20
		
	end
end
