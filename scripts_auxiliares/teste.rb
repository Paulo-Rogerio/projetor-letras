#!/usr/bin/env ruby
arq = "/Users/PauloRogerio/Desktop/Letras/importar.txt"

File.foreach(arq).with_index do |line, line_num|
     linha = "#{line_num}: #{line}"
     #arr = linha.gsub(/\n/,'').split(',')
     arr = linha.split(',')

     puts "#{arr[0]} - #{arr[1]} - #{arr[2]}"

end
