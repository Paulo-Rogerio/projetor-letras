class Predio < ActiveRecord::Base
	has_many :preletores
	has_many :reunioes
end
