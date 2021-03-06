class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @h = {"monday" => "월요일", "tuesday" => "화요일", "wednesday" => "수요일", "thursday" => "목요일", "friday" => "금요일", "saturday" => "토요일"}
    @h.each {|key,value| eval "@#{key} = Schedule.where(day: '#{key}').order(hour: :asc)"}
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
        format.html { redirect_to @schedule, notice: '스케쥴이 등록되었습니다' }
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
        format.html { redirect_to @schedule, notice: '스케쥴이 수정되었습니다' }
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
