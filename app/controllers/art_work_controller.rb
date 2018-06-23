class ArtworkController < ApplicationController
    get '/artwork' do
        if session[:artist_id]
            @artwork = Artwork.all
            erb :'artwork/artwork'
        else
            redirect to '/login'
        end
    end

    get '/artwork/new' do
        if session[:artist_id]
            erb :'artwork/create_artwork'
        else
            redirect to '/login'
        end
    end

    post '/artwork' do
        if params[:art]== ""
            redirect to '/artwork/new'
        else
            artist = Artist.find_by_id(session[:artist_id])
            @artwork = Artwork.create(:art => params[:art], :artist_id => artist.id)
            redirect to "/artwork/#{@artwork.id}"
        end
    end

    get '/artwork/:id' do
        if session[:artist_id]
            @artwork = Artwork.find_by_id(params[:id])
            erb :'/artwork/show_artwork'
        else
            redirect to '/login'
        end
    end

    get '/artwork/:id/edit' do
        if session[:artist_id]
            @artwork = Artwork.find_by_id(params[:id])
            if @artwork.artist_id == session[:artist_id]
                erb :'artwork/edit_artwork'
            else
                redirect to '/artwork'
            end
        else
            redirect to '/login'
    end
    end
        
    patch '/artwork/:id' do
        if params[:art] == ""
            redirect to "/artwork/#{params[:id]}/edit"
        else
            @artwork = Artwork.find_by_id(params[:id])
            @artwork.art = params[:art]
            @artwork.save
            redirect to "/artwork/#{@artwork.id}"
        end
    end
    
    delete '/artwork/:id/delete' do
        @artwork = Artwork.find_by_id(params[:id])
        if session[:artist_id]
            @artwork = Artwork.find_by_id(params[:id])
            if @artwork.artist_id == session[:artist_id]
                @artwork.delete
                redirect to '/artwork'
            else
                redirect to '/artwork'
            end
        else
            redirect to '/login'
        end
    end
end
end
            
            
















