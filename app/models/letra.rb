class Letra < ActiveRecord::Base
	has_many :letras_reunioesletras
	has_many :reunioesletras, through: :letras_reunioesletras, :dependent => :delete_all
	mount_uploader :arquivo, ArquivoUploader

	def nome_da_musica_e_cantor
	    "#{nome} - #{cantor}"
	end
end
