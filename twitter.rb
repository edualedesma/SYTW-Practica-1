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
    @usuario = Hash.new
    # Get de number of users specified by @number variable.
    if @number < 10
      amigos = client.friend_ids(@name).take(@number)
    else
      amigos = client.friend_ids(@name).take(5)
    end
    amigos.each do |amigote|
      fo = client.user(amigote)
      # Solo iteramos si no es un usuario protegido
      begin
        if (fo.protected.to_s != "true")
          @usuario[fo.screen_name.to_s] = fo.followers_count  # Le asigno el número de seguidores
        end
      end
    end
  end
  erb :twitter
end

