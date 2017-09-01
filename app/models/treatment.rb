class Treatment < ApplicationRecord
  belongs_to :user
  belongs_to :medicine
  # belongs_to :period
  belongs_to :event
end
