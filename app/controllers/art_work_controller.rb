class ArtworkController < ApplicationController
    get '/artwork' do
        redirect_if_not_logged_in
            @artwork = artwork.all
            erb :'artwork/index'
    end

    get '/artwork/new' do
        redirect_if_not_logged_in
        @error_message = params[:error]
        erb :'artwork/new'
    end

    post '/artwork' do
        redirect_if_not_logged_in
        if params[:art]== ""
            redirect to '/artwork/new'
        else
            artist = Artist.find(session[:artist_id])
            @artwork = Artwork.create(:art => params[:art], :artist_id => artist.id)
            redirect to "/artwork/#{@artwork.id}"
        end
    end

    get '/artwork/:id' do
        redirect_if_not_logged_in       
        @artwork = Artwork.find(params[:id])
        erb :'/artwork/show_artwork'
    end

    get '/artwork/:id/edit' do
        redirect_if_not_logged_in
        @error_message = params[:error]
        if session[:artist_id]
            @artwork = Artwork.find(params[:id])
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
            @artwork = Artwork.find(params[:id])
            @artwork.art = params[:art]
            @artwork.save
            redirect to "/artwork/#{@artwork.id}"
        end
    end
    
    delete '/artwork/:id/delete' do
        @artwork = Artwork.find(params[:id])
        if session[:artist_id]
            @artwork = Artwork.find(params[:id])
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

            
            
















