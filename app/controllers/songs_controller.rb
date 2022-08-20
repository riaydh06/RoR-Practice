class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
    end

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(params.require(:song).permit(:title, :description))
        if @song.save
          redirect_to @song 
        else
          render 'new'
        end
      end
    
    
end