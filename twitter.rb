# Nombre: Eduardo Javier Acuña Ledesma
# Fecha: 24 de septiembre de 2014
# Email: alu0100302479@ull.edu.es

# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'

require './configure'

get '/' do
  @todo_tweet = []
  @name = ''
  @number = 0		
  erb :twitter
end

post '/' do
  @todo_tweet = []
  client = my_twitter_client() 
  @name = params[:firstname] || ''
  @number = params[:n].to_i
  @number = 1 if @number <= 0
  if client.user? @name 
    #ultimos_t = client.user_timeline(@name,{:count=>@number.to_i})
    #@todo_tweet =(@todo_tweet != '') ? ultimos_t.map{ |i| i.text} : ''

    @usuario = Hash.new
    amigos = client.friend_ids(@name)
    amigos.each do |amigote|
      f = client.user(amigote)
      # Solo iteramos si no es un usuario protegido
      begin
      if (f.protected.to_s != "true")
         @usuario[f.screen_name.to_s] = f.followers_count
	 puts "#{f.screen_name.to_s} tiene #{f.followers_count} followers"
      end
      rescue
         puts "Se ha producido un error por favor intentelo de nuevo"
      end

end


  end

  erb :twitter
end

