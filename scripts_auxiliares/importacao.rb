#!/usr/bin/env ruby
require 'net/http'
require 'openssl'
require 'json'

key = ENV['VAGALUME_KEY']
mus = 'quebrando-as-cadeias'
art = 'Joao-Paulo-Colin'
url = "https://api.vagalume.com.br/search.php?art=#{art}&mus=#{mus}&apikey=#{key}"
arq = ('/Users/PauloRogerio/Desktop/letra.txt')

uri = URI.parse(url)
http = Net::HTTP.new(uri.host, uri.port)
http.read_timeout = 180
http.use_ssl = 'https'
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Post.new(uri.request_uri)
response = http.request(request)


 if response.code.to_i == 200
   file = JSON.parse(response.body)
   file["mus"].each do |letra|
        
	File.open(arq,'w') do |h|
           h.write letra["text"]
        end

        l = Letra.new
        l.nome = 'Quebrando Correntes'
        l.cantor = 'Joao Paulo Colin'
        l.letra = letra["text"]
        l.arquivo = File.open(arq) 
        l.save
        p "Importado com sucesso"

   end
 else
   puts "Erro ao conectar na api"
 end  
