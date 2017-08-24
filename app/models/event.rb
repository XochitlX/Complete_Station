class Event < ApplicationRecord
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def self.reminder
  	account_sid = 'ACf87e78b355873a181580e9159dadc2aa'
    auth_token = '6fdba738be1a51067ba0abc457937302'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.api.account.messages.create({
      :from => '+14243389879',
      :to => '+525532385434',
      :body => 'Step by step'
	})
  end
end
