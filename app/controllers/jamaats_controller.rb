class JamaatsController < ApplicationController
  # GET /jamaats
  # GET /jamaats.json
  def index
    @jamaats = Jamaat.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jamaats }
    
    end
  end

  def jm
    @jamaat = Jamaat.find(params[:id])
    @users = @jamaat.users.find(:all)
    
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jamaat }
      end
    
  end
  # GET /jamaats/1
  # GET /jamaats/1.json
  def show
    @jamaat = Jamaat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jamaat }
    end
  end

  # GET /jamaats/new
  # GET /jamaats/new.json
  def new
    @jamaat = Jamaat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jamaat }
    end
  end

  # GET /jamaats/1/edit
  def edit
    @jamaat = Jamaat.find(params[:id])
  end

  # POST /jamaats
  # POST /jamaats.json
  def create
    @jamaat = Jamaat.new(params[:jamaat])

    respond_to do |format|
      if @jamaat.save
        format.html { redirect_to @jamaat, notice: 'Jamaat was successfully created.' }
        format.json { render json: @jamaat, status: :created, location: @jamaat }
      else
        format.html { render action: "new" }
        format.json { render json: @jamaat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jamaats/1
  # PUT /jamaats/1.json
  def update
    @jamaat = Jamaat.find(params[:id])

    respond_to do |format|
      if @jamaat.update_attributes(params[:jamaat])
        format.html { redirect_to @jamaat, notice: 'Jamaat was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @jamaat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jamaats/1
  # DELETE /jamaats/1.json
  def destroy
    @jamaat = Jamaat.find(params[:id])
    @jamaat.destroy

    respond_to do |format|
      format.html { redirect_to jamaats_url }
      format.json { head :ok }
    end
  end
end
