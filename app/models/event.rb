class Event < ApplicationRecord

  has_many :treatments
  has_many :users, through: :treatments
  has_many :medicines, through: :treat

  
	validates :title, presence: true
  	attr_accessor :date_range

  	def all_day_event?
    	self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  	end




  def self.reminder
  		p "entraaaaaaaa"
	 
		#Reminder.where(control_missing: )
		# control = Reminder.last.control_missing.scan(/........../)
  #   user = Reminder.last.user_id


    reminder_all = Reminder.all
    
    reminder_all.each do |rem|
      #p "user"
      #rem_user = User.find(rem.user_id)
      treatment = Treatment.find(rem.treatment_id)
      user = User.find(treatment.user_id)
      medicine = Medicine.find(treatment.medicine_id)


      control = rem.control_missing.scan(/........../)

      control.each_with_index do |time, index|
        if Time.at(time.to_i).strftime('%Y-%m-%d %I:%M') == Time.now.strftime('%Y-%m-%d %I:%M')
          Rails.logger.info "Dentrooo, it's #{Time.now}"

          account_sid = 'ACf87e78b355873a181580e9159dadc2aa'
          auth_token = '6fdba738be1a51067ba0abc457937302'

          @client = Twilio::REST::Client.new account_sid, auth_token

          @client.api.account.messages.create({
            :from => '+14243389879',
            #:to => '+525532385434',
            :to => "+52#{user.phone_number}",
            #:body => "Pruebaaaaaaaaaa v3"
            #:body => "Tomar: #{rem_user.medicines.dose} #{rem_user.medicines.presentation_to_take} de #{rem_user.medicines.name},  "
            :body => "Take #{medicine.dose} #{medicine.presentation_to_take} of '#{medicine.name}'"
          })

          control.delete_at(index)
        end
      end
      new_control = control.join
      rem.update(control_missing: new_control)
    

    end
   

  end
end

