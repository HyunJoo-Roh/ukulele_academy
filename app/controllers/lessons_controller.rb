class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @user = User.find(params[:user_id])
    @lessons = @user.lessons  
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @user = User.find(params[:user_id])
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @user = User.find(params[:user_id])
    @lesson.user = @user

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to user_lessons_path(@user), notice: 'Lesson was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lesson }
      else
        format.html { render action: 'new' }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @lesson }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @user = User.find(params[:user_id])
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to user_lessons_url @user }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:lesson_date, :turn, :goal, :song, :homework, :user_id)
    end
end
