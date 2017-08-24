
require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton

# Awesome recurrent task...

#s.every '1m' do
s.at '2017/08/24 11:45:00' do
 #Rails.logger.info "hello, it's #{Time.now}"

 #Rails.logger.info User.prueba
 Event.reminder
end
