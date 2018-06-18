class ArtistsController < ApplicationController
    
    get '/artists/:slug' do
       if @artist = artist.find_by_slug(params[:slug])
        erb :'artists/show'
       end

        @artist = artist.find(params[:id])
            if !@artist.nil? && @artist == current_artist
                erb :'artists/show'
            else
                redirect '/artwork'
            end
        end
  

    get '/join' do
        if !session[:artist_id]
            erb :'artists/create_artist'
        else
            redirect to '/artwork'
        end
    end

    post '/join' do
        if params[:artistname] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/join'
        else
            @artist = artist.new(:artistname => params[:artistname], :email => params[:email], :password => params[:password])
            @artist.save
                session[:artist_id] = @artist.id
                redirect to '/artwork'
        end
    end

    get '/login' do
        @error_message = params[:error]
        if !session[:artist_id]
            erb :'artists/login'
        else
            redirect '/artwork'
        end
    end

    post '/login' do
        artist = artist.find_by(:artistname =>params[:artistname])
        if artist && artist.authenticate(params[:password])
            session[:artist_id] = artist.id
            redirect '/artwork'
        else            
            redirect to '/join'
        end
    end

    get '/logout' do
        if session[:artist_id] !=nil
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end
end
            
            
            
            
            
            
            
            
            







