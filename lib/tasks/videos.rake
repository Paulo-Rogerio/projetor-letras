namespace :videos do
  desc "Limpa os videos antigos"
  task clean: :environment do

    arq = Rails.root.join('public', 'uploads', 'video')

    #======================== Inicio ====================

    videos = Video.all

		contador = 0
		videos.each do |v|

			puts "Excluindo Videos: #{arq}" 
      v.destroy					
			contador += 1
                	
		end

    #======================== Fim =======================



  end

end


