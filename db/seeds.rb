#################################
# Seed for Calendar

# 3650.times do 
#   event = Event.new
#   event.title = Faker::Book.title
#   start = Faker::Time.between(4.years.ago, Date.today + 4.years, :morning)
#   event.start = start
#   event.end = Faker::Time.between(start, start + 2.days, :evening)
#   event.color = ['black','green','red', nil].sample
#   event.save
# end




#################################
# Seed for Model user-treatment
#Userss
@user1 = User.create(name: "xochitl", password: "xoch", admin: 1)
@user2 = User.create(name: "july", password: "jul", admin: 0)
@user3 = User.create(name: "mario", password: "ma", admin: 0)


#Medicine
@medicine1 = Medicine.create(name: 'next', unit_measurement: 'mg', presentation_to_take: 'tableta')
@medicine2 = Medicine.create(name: 'paracetamol', unit_measurement: 'mg', presentation_to_take: 'tableta')
@medicine3 = Medicine.create(name: 'ambroxol', unit_measurement: 'ml', presentation_to_take: 'liquido')


#Period
@period1 = Period.create(start_day_treatment: DateTime.new(2017, 8, 20, 17, 00, 00), days_of_treatment: 7)
@period2 = Period.create(start_day_treatment: DateTime.new(2017, 8, 25, 17, 00, 00), days_of_treatment: 15)

#Treatment
Treatment.create(user_id: @user1.id, medicine_id: @medicine1.id, 
				period_id: @period1.id, dose_every: 8, start_hour: DateTime.new(2017, 8, 20, 17, 6, 00))
Treatment.create(user_id: @user3.id, medicine_id: @medicine3.id, 
				period_id: @period2.id, dose_every: 8, start_hour: DateTime.new(2017, 8, 20, 17, 8, 00))


# def information
# 	p treatment = Treatment.all

# 	treatment.each do |record|
# 		#Treatment.last.user.admin
# 		if record.user.admin
# 			p "**Historial Administrador**"
# 			p "Nombre: "
# 			p record.user.name
# 			p
# 			p "Medicina: "
# 			p record.medicine.name
# 			p "Unidad de medida: "
# 			p record.medicine.unit_measurement
# 			p "Presentación: "
# 			p record.medicine.presentation_to_take
# 			p "Cantidad a tomar (por/hrs): "
# 			p record.dose_every
# 			p "Inicio: "
# 			p start = record.period.start_day_treatment
# 			p "Termino: "
# 			d = record.period.days_of_treatment
# 			p start + d.days

# 		else
# 			p "Historial Otros Pacientes"

# 			p "Nombre: "
# 			p record.user.name
# 			p
# 			p "Medicina: "
# 			p record.medicine.name
# 			p "Unidad de medida: "
# 			p record.medicine.unit_measurement
# 			p "Presentación: "
# 			p record.medicine.presentation_to_take
# 			p "Cantidad a tomar (por/hrs): "
# 			p record.dose_every
# 			p "Inicio: "
# 			p start = record.period.start_day_treatment
# 			p "Termino: "
# 			d = record.period.days_of_treatment
# 			p start + d.days

# 		end
# 	end
	
# end


# information

