class Preletor < ActiveRecord::Base
	belongs_to :predio
	belongs_to :funcao
	has_many :reunioes
end
