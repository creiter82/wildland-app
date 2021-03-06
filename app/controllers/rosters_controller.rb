class RostersController < ApplicationController
  before_action :authenticate_personnel!, except: [:show]
  before_action :set_roster, only: [:show, :edit, :update, :send_email, :destroy]
  before_action :is_admin?, only: [:create, :new, :edit, :destroy]

  # GET /rosters
  # GET /rosters.json
  def index
    @rosters = Roster.all
  end

  # GET /rosters/1
  # GET /rosters/1.json
  def show
    @roster = Roster.find(params[:id])
    @positions = @roster.apparatus.collect{|a| a.positions}.flatten.uniq
    @assignment = @roster.assignments.find{|a| a.roster_id == @roster.id }
    #@assign = @assignment.id
  end

  # GET /rosters/new
  def new
    @roster = Roster.new
    @apparatus = Apparatu.all
  end

  # GET /rosters/1/edit
  def edit
    @apparatus = Apparatu.all
  end

  # POST /rosters
  # POST /rosters.json
  def create
    @roster = Roster.new(roster_params)
    @roster.name = "week of #{@roster.start_time.strftime("%m/%d/%Y")}"
    @roster.end_time = @roster.start_time.end_of_week

    respond_to do |format|
      if @roster.save
        format.html { redirect_to @roster, notice: 'Roster was successfully created.' }
        format.json { render :show, status: :created, location: @roster }
      else
        format.html { render :new }
        format.json { render json: @roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rosters/1
  # PATCH/PUT /rosters/1.json
  def update
    respond_to do |format|
      if @roster.update(roster_params)
        format.html { redirect_to @roster, notice: 'Roster was successfully updated.' }
        format.json { render :show, status: :ok, location: @roster }
      else
        format.html { render :edit }
        format.json { render json: @roster.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #def send_order_mail
    #@order = Order.find(params[:id])
    #@client = Customer.find(@order.client_id)
  
    #OrderMailer.order_send(@order, @client).deliver
    #flash[:notice] = "Order has been sent."
    #redirect_to order_path(@order.id)
  #end
  
  def send_mail
    @roster = Roster.find(params[:id])
    #@deploy = @roster.assignments.where(alternate: false)
    @personnel = Personnel.all
    DeploymentNotifier.send_deployment_roster(@roster, @personnel).deliver
    flash[:notice] = "Deployment email has been sent."
    redirect_to @roster
  end

  # DELETE /rosters/1
  # DELETE /rosters/1.json
  def destroy
    @roster.destroy
    respond_to do |format|
      format.html { redirect_to rosters_url, notice: 'Roster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster
      @roster = Roster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roster_params
      params.require(:roster).permit(:name, :start_time, :end_time, apparatu_ids:[])
    end
end
