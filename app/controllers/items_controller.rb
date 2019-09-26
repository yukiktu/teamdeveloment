class ItemsController < ApplicationController
before_action :authenticate_admin!, only: [:edit, :update]

  def index
    @items = Item.where(sales_status: "販売中").page(params[:page]).per(12).order(:id)
    @item = 
  end

  def kensaku
    if params[:keywords].blank?
      redirect_to items_path
      return
    end
    keywords = params[:keyword]
    terms = keywords.split
    term2=[]
    terms.each do |term|
      term2 = term2 + term.split("　")
    end
    # binding.pry
    keywords = term2
    keywords.uniq!
    #items = 'nil'
    keywords.each do |keyword|
      searchword = "%" + keyword.to_s + "%"
        #binding.pry
        items = Item.where(sales_status: "販売中").where('item_name LIKE ?', searchword)

        artist_id = Artist.where('artist_name LIKE ?', searchword).present?
        artists = Item.where(sales_status: "販売中").where(artist_id: artist_id)

        genre_id = Genre.where('genre_name LIKE ?', searchword)
        genres = Item.where(sales_status: "販売中").where(genre_id: genre_id)
        @items = items + artists + genres
        @items.uniq!
        @items = Kaminari.paginate_array(@items).page(params[:page]).per(12)
    end
    render 'index'
  end

  def search
    @items = Item.where(item_name: params[:search]).page(params[:page]).per(12).order(:id)
    @label = Label.find_by(@label)#@label_id)
    @genre = Genre.find_by(@item)
    @artist = Artist.find_by(@artist)
      render :index
  end

  def show
    @item = Item.find_by(id: params[:id])
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
    @item = Item.find(params[:id].to_i)
    if item_params[:cost_price].present? && item_params[:list_price].present?
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

      @item = Item.find(params[:id].to_i)
      @item.artist_id = @artist.id
      @item.genre_id = @genre.id
      @item.label_id = @label.id

      if @item.update(item_params)
        redirect_to items_path
      else
         # redirect_to edit_item(@item)
        render 'edit'
      end
    else
      # render 'edit'
      redirect_to edit_item_path(@item)
      # redirect_to edit_item_path(params[:id])
    end
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