class Letra < ActiveRecord::Base

	mount_uploader :arquivo, ArquivoUploader
end
