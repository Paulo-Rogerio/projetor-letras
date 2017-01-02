class Reuniao < ActiveRecord::Base
	belongs_to :preletor
	belongs_to :tema
	belongs_to :predio
	mount_uploader :arquivo, ArquivoUploader
end
