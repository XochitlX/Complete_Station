class Event < ApplicationRecord
	validates :title, presence: true
  	attr_accessor :date_range

  	def all_day_event?
    	self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  	end

  	def self.reminder
  		p "entraaaaaaaa"
	
		#Reminder.where(control_missing: )
		control = Reminder.last.control_missing.scan(/........../)
    	control.each_with_index do |time, index|
 			if Time.at(time.to_i).strftime('%Y-%m-%d %I:%M') == Time.now.strftime('%Y-%m-%d %I:%M')
 				Rails.logger.info "Dentrooo, it's #{Time.now}"

 				account_sid = 'ACf87e78b355873a181580e9159dadc2aa'
    			auth_token = '6fdba738be1a51067ba0abc457937302'

    			@client = Twilio::REST::Client.new account_sid, auth_token

    			@client.api.account.messages.create({
      			:from => '+14243389879',
      			:to => '+525532385434',
      			#:to => '+525521868770',
      			:body => 'Step by step Pruebas minutos V2'
				})
				


				p control.length
    			p control.delete_at(index)
    			p index

    			p control
    			p actual_schedule = control.join
				Reminder.update(1, control_missing: actual_schedule)
  			end
		end
  	end
end

