class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        @favorite = current_user.favorites.build(micropost_id: params[:micropost_id])
        @favorite.save
        redirect_to root_path
    end
    
    def destroy
        @favorite = current_user.favorites.find_by(id: params[:id])
        @favorite.destroy
        redirect_to root_path
    end
end
