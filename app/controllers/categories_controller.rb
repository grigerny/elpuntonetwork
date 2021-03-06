class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  
  
  def index
      @search = Listing.search(params[:q])
      @listing = @search.result
      @categories = Category.all
      @listings = Listing.all
      @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
        marker.lat listing.latitude
        marker.lng listing.longitude
        location_link = view_context.link_to listing.company, area_listing_path(listing.area_id,listing)
        marker.picture({
                 "url" => "http://i.imgur.com/DkGmkTs.png",
                 "width" =>  60,
                 "height" => 60})
        marker.infowindow "<h4><u>#{location_link}</u></h4>"
        marker.infowindow render_to_string(:partial => "/listings/marker", :locals => { :listing => listing})
      end
      

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @search = Listing.search(params[:q])
    @listing = @search.result
    @categories = Category.all
    @category = Category.find(params[:id])
    @grouped_listing = @category.listings.group_by &:industry
   

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render json: categories_path, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
  


end
