class Video < ActiveRecord::Base
	mount_uploader :arquivo, ArquivoUploader
end
