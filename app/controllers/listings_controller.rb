class ListingsController < ApplicationController
  # GET /listings
  # GET /listings.json
  
  
  def index
    @categories = Category.all
    @search = Listing.search(params[:q])      
    @listings = @search.result
  
    
     if params[:search].present?
         @listings = Listing.near(params[:search], 15, :order => :distance)
       end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @categories = Category.all
    @listing = Listing.find(params[:id])
    @search = Listing.search(params[:q])
    @listings = @search.result

 
    
    if params[:search].present?
         @listings = Listing.near(params[:search], 15, :order => :distance)
       end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listing }
    end
  end

  # GET /listings/new
  # GET /listings/new.json
  def new
    @area = Area.find(params[:area_id])
    @listing = @area.listings.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @area = Area.find(params[:area_id])
    @listing = @area.listings.find(params[:id])
  end

  # POST /listings
  # POST /listings.json
  def create
    @area = Area.find(params[:area_id])
    @listing = @area.listings.build(params[:listing])
  
      
    respond_to do |format|
      if @listing.save
        format.html { redirect_to([@listing.area, @listing], notice: 'Listing was successfully created.') }
        format.json { render json: @listing, status: :created, location: @listing }
      else
        format.html { render action: "new" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.json
  def update
    @area = Area.find(params[:area_id])
    @listing = @area.listings.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html  { redirect_to([@listing.area, @listing], :notice => 'Comment was successfully updated.') }        
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @area= Area.find(params[:area_id])
    @listing = @area.listings.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to area_listings_url }
      format.json { head :no_content }
    end
  end
end
