class ItemsController < ApplicationController
#before_action :authenticate_admin_user!, only: [:edit, :update]

  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(12).order(:id)
  end

  def search

    @items = Item.where(item_name: params[:search]).page(params[:page]).per(12).order(:id)
    @label = Label.find_by(@label)#@label_id)
    @genre = Genre.find_by(@item)
    @artist = Artist.find_by(@artist)
      render :index
  end

  def show
    @item = Item.find(params[:id])
    @gacket_image = GacketImage.find_by(item_id: @item.id)
  end

  def edit
    @item = Item.find(params[:id])
    @item.gacket_images.build
    @disc = @item.discs.build
    @song = @disc.songs.build
    @label = Label.find_by(id: @item.label_id)
    @genre = Genre.find_by(id: @item.genre_id)
    @artist = Artist.find_by(id: @item.artist_id)
  end


  def update
    if Artist.where(artist_name: artist_params["artist_name"]).empty?
      @artist = Artist.new(artist_params)
      @artist.save
    else
      @artist = Artist.find_by(artist_name: artist_params["artist_name"])
    end

    if Genre.where(genre_name: genre_params["genre_name"]).empty?
      @genre = Genre.new(genre_params)
      @genre.save
    else
      @genre = Genre.find_by(genre_name: genre_params["genre_name"])
    end

    if Label.where(label_name: label_params["label_name"]).empty?
      @label = Label.new(label_params)
      @label.save
    else
      @label = Label.find_by(label_name: label_params["label_name"])
    end

    @item = Item.find(params[:id])
    @item.artist_id = @artist.id
    @item.genre_id = @genre.id
    @item.label_id = @label.id

    @item.update(item_params)

    redirect_to items_path
  end

private
    def item_params
     params.require(:item).permit(
      :item_name,:list_price,:cost_price,:sales_status,:genre_id,:artist_id,:label_id,:release_date,
      :jacket_number,gacket_images_images:[],discs_attributes:[:id,:disc_name,:disc_number,
      songs_attributes:[:id,:recording_number,:song_title,:play_time]])
    end

    def artist_params
      params.require(:artist).permit(:artist_name)
    end

    def label_params
        params.require(:label).permit(:label_name)
    end

    def genre_params
        params.require(:genre).permit(:genre_name)
    end

 end