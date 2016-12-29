class Reuniaoletra < ActiveRecord::Base
	has_many :letras_reunioesletras
	has_many :letras, through: :letras_reunioesletras, :dependent => :delete_all
	accepts_nested_attributes_for :letras_reunioesletras, reject_if: :all_blank, allow_destroy: true
end
