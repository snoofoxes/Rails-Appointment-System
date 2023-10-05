class HomeController < ApplicationController
    def index
    end
    
    def login
        flash[:notice] = "Logged In Succesfully"
        flash[:alert] = "Invalid Authentication"
    end
end