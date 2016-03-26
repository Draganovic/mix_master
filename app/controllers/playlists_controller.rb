class PlaylistsController<ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def edit
    # @playlist = Playlist.find(params[:id])
    @songs = Song.all
  end

  def update
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to playlist_path(@playlist.id)
    else
      render :new
    end
  end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

end
