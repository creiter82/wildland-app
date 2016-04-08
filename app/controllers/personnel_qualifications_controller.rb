class PersonnelQualificationsController < ApplicationController
  before_action :set_personnel_qualification, only: [:show, :edit, :update, :destroy]

  # GET /personnel_qualifications
  # GET /personnel_qualifications.json
  def index
    @personnel_qualifications = PersonnelQualification.all
  end

  # GET /personnel_qualifications/1
  # GET /personnel_qualifications/1.json
  def show
  end

  # GET /personnel_qualifications/new
  def new
    @personnel_qualification = PersonnelQualification.new
  end

  # GET /personnel_qualifications/1/edit
  def edit
  end

  # POST /personnel_qualifications
  # POST /personnel_qualifications.json
  def create
    @personnel_qualification = PersonnelQualification.new(qualification_id: params[:qualification_id], personnel_id: params[:personnel_id])

    respond_to do |format|
      if @personnel_qualification.save
        format.html { redirect_to personnels_path, notice: 'Personnel qualification was successfully created.' }
        format.json { render :show, status: :created, location: @personnel_qualification }
      else
        format.html { render :new }
        format.json { render json: @personnel_qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personnel_qualifications/1
  # PATCH/PUT /personnel_qualifications/1.json
  def update
    respond_to do |format|
      if @personnel_qualification.update(personnel_qualification_params)
        format.html { redirect_to @personnel_qualification, notice: 'Personnel qualification was successfully updated.' }
        format.json { render :show, status: :ok, location: @personnel_qualification }
      else
        format.html { render :edit }
        format.json { render json: @personnel_qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personnel_qualifications/1
  # DELETE /personnel_qualifications/1.json
  def destroy
    @personnel_qualification.destroy
    respond_to do |format|
      format.html { redirect_to personnel_qualifications_url, notice: 'Personnel qualification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personnel_qualification
      @personnel_qualification = PersonnelQualification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personnel_qualification_params
      params.require(:personnel_qualification).permit(:personnel_id, :qualification_id)
    end
end
