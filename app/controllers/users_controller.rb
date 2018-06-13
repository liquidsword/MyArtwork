class UsersController < ApplicationController
    
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/artwork'
    end
  end

    get '/join' do
        if !session[:user_id]
            erb :'users/create_user'
        else
            redirect to '/artwork'
        end
    end

    post '/join' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/join'
        else
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save
                session[:user_id] = @user.id
                redirect to '/artwork'
        end
    end

    get '/login' do
        @error_message = params[:error]
        if !session[:user_id]
            erb :'users/login'
        else
            redirect '/artwork'
        end
    end

    post '/login' do
        user = User.find_by(:username =>params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/artwork'
        else            
            redirect to '/join'
        end
    end

    get '/logout' do
        if session[:user_id] !=nil
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end
end
            
            
            
            
            
            
            
            
            







