class Recado < ActiveRecord::Base
	validates :interessado, :recado, presence: true
end
