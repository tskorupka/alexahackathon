class LearnedSound < ActiveRecord::Base
  belongs_to :user
  belongs_to :sound
end
