class PushupsController < ApplicationController
before_filter :authenticate_user!
  # GET /pushups
  # GET /pushups.json
  def index
    @pushups = current_user.pushups.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pushups }
    end
  end

  # GET /pushups/1
  # GET /pushups/1.json
  def show
    @pushup = Pushup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pushup }
    end
  end

  # GET /pushups/new
  # GET /pushups/new.json
  def new
    @pushup = Pushup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pushup }
    end
  end

  # GET /pushups/1/edit
  def edit
    @pushup = Pushup.find(params[:id])
  end

  # POST /pushups
  # POST /pushups.json
  def create
    @pushup = Pushup.new(params[:pushup])

    respond_to do |format|
      if @pushup.save
        format.html { redirect_to @pushup, notice: 'Pushup was successfully created.' }
        format.json { render json: @pushup, status: :created, location: @pushup }
      else
        format.html { render action: "new" }
        format.json { render json: @pushup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pushups/1
  # PUT /pushups/1.json
  def update
    @pushup = Pushup.find(params[:id])

    respond_to do |format|
      if @pushup.update_attributes(params[:pushup])
        format.html { redirect_to @pushup, notice: 'Pushup was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pushup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pushups/1
  # DELETE /pushups/1.json
  def destroy
    @pushup = Pushup.find(params[:id])
    @pushup.destroy

    respond_to do |format|
      format.html { redirect_to pushups_url }
      format.json { head :ok }
    end
  end
end
