class StickiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_sticky, only: [:show, :edit, :update, :destroy]

  # GET /stickies
  # GET /stickies.json
  def index
    @stickies = Sticky.all
  end

  # GET /stickies/1
  # GET /stickies/1.json
  def show
  end

  # GET /stickies/new
  def new
    @sticky = Sticky.new
  end

  # GET /stickies/1/edit
  def edit
  end

  # POST /stickies
  # POST /stickies.json
  def create
    @sticky = Sticky.new(sticky_params)
    @stickySection = ["Key Partners", "Key Activities","Key Resources","Value Proposition","Customer Relationships","Chanels","Customer Segments", "Cost Structure","Revenue Streams"]
    respond_to do |format|
      if @sticky.save
        current_user.createActivity(@sticky, "created")
        format.html { redirect_to @sticky, notice: 'Sticky was successfully created.' }
        format.json { render :show, status: :created, location: @sticky }
      else
        format.html { render :new }
        format.json { render json: @sticky.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stickies/1
  # PATCH/PUT /stickies/1.json
  def update
    respond_to do |format|
      if @sticky.update(sticky_params)
        current_user.createActivity(@sticky, "updated")
        format.html { redirect_to @sticky, notice: 'Sticky was successfully updated.' }
        format.json { render :show, status: :ok, location: @sticky }
      else
        format.html { render :edit }
        format.json { render json: @sticky.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stickies/1
  # DELETE /stickies/1.json
  def destroy
    @sticky.destroy
    current_user.createActivity(@sticky, "deleted")

    respond_to do |format|
      format.html { redirect_to stickies_url, notice: 'Sticky was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sticky
      @sticky = Sticky.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sticky_params
      params.require(:sticky).permit(:body, :user_id, :idea_id, :section, :stage)
    end
end
