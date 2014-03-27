class User < ActiveRecord::Base
  has_many :lessons
  has_many :schedules
end
