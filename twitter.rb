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

    # Get the id-users specified by @number variable
    if @number < 10
      amigos = client.friend_ids(@name).take(@number)
    else
      amigos = client.friend_ids(@name).take(5)
    end

    # Get user from id in amigo and assign the number of followers
    amigos.each do |amigo|
      fo = client.user(amigo)
      # Only iterate if not a protected user
      if (fo.protected.to_s != "true")
        @usuario[fo.screen_name.to_s] = fo.followers_count
      end
    end
  end
  erb :twitter
end