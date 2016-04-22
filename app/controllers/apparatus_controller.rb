class ApparatusController < ApplicationController
  before_action :set_apparatu, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?

  # GET /apparatus
  # GET /apparatus.json
  def index
    @apparatus = Apparatu.all
  end

  # GET /apparatus/1
  # GET /apparatus/1.json
  def show
  end

  # GET /apparatus/new
  def new
    @apparatu = Apparatu.new
  end

  # GET /apparatus/1/edit
  def edit
  end

  # POST /apparatus
  # POST /apparatus.json
  def create
    @apparatu = Apparatu.new(apparatu_params)
    if @apparatu.save
      flash[:notice] = "Apparatus was created"
      redirect_to apparatus_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /apparatus/1
  # PATCH/PUT /apparatus/1.json
  def update
    respond_to do |format|
      if @apparatu.update(apparatu_params)
        format.html { redirect_to @apparatu, notice: 'Apparatu was successfully updated.' }
        format.json { render :show, status: :ok, location: @apparatu }
      else
        format.html { render :edit }
        format.json { render json: @apparatu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apparatus/1
  # DELETE /apparatus/1.json
  def destroy
    @apparatu.destroy
    respond_to do |format|
      format.html { redirect_to apparatus_url, notice: 'Apparatu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apparatu
      @apparatu = Apparatu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apparatu_params
      params.require(:apparatu).permit(:designator, :apparatus_class, :apparatus_type)
    end
    
end
