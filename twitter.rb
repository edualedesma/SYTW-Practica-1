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

    i = 0
    procesados = 0
    @usuario = Hash.new
    amigos = Twitter.friend_ids(@name)
    amigos.ids.each do |aid|
    i = i + 1

    if (i <= @number) 
      f = Twitter.user(aid)
      # Solo iteramos si no es un usuario protegido
      begin
      if (f.protected.to_s != "true")
         @usuario[f.screen_name.to_s] = f.followers_count
         procesados = procesados + 1
      end
      rescue
         puts "Se ha producido un error por favor intentelo de nuevo"
      end
   end
end






  end
  erb :twitter
end

