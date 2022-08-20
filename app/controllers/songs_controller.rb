class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
    end

    def index
        @songs = Song.all()
    end

    def new
    
    end

    def create
        @song = Song.new(params.require(:song).permit(:title, :description))
        @song.save
        redirect_to song_path(@song)
    end
    
    
end