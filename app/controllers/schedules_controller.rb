class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    monday = Schedule.where(:day => 'monday') 
    tuesday = Schedule.where(:day => 'tuesday') 
    wednesday = Schedule.where(:day => 'wednesday') 
    thursday = Schedule.where(:day => 'thursday') 
    friday = Schedule.where(:day => 'friday') 
    saturday = Schedule.where(:day => 'saturday') 
    
    @week = [monday,tuesday,wednesday,thursday,friday,saturday]
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    @users = User.all
  end

  # GET /schedules/1/edit
  def edit
    @users = User.all
  end

  # POST /schedules
  # POST /schedules.json
  def create
    # @user = User.find(schedule_params[:user_id])
    @schedule = Schedule.new(schedule_params)
    # @schedule.user = @user
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @schedule }
      else
        format.html { render action: 'new' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @schedule }
      else
        format.html { render action: 'edit' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:day, :hour, :user_id)
    end
end