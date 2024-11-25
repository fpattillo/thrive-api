class PeriodsController < ApplicationController
  before_action :set_period, only: %i[ show update destroy ]

  # GET /periods
  def index
    @periods = Period.all
    @periods = @periods.map do |period|
      {
        id: period.id,
        name: period.name,
        duration: period.duration,
        completion: period.completion,
        tasks: period.tasks.map do |task|
          {
            id: task.id,
            name: task.name,
            variant: task.variant,
            progress: task.progress,
            goal: task.goal,
            subtasks: task.subtasks.map do |subtask|
              {
                id: subtask.id,
                name: subtask.name,
                completed: subtask.completed
              }
            end,
            tags: task.tags.map do |tag|
              {
                id: tag.id,
                name: tag.name
              }
            end
          }
        end
      }
    end

    render json: @periods
  end

  # GET /periods/1
  def show
    render json: @period
  end

  # POST /periods
  def create
    @period = Period.new(period_params)

    if @period.save
      render json: @period, status: :created, location: @period
    else
      render json: @period.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /periods/1
  def update
    if @period.update(period_params)
      render json: @period
    else
      render json: @period.errors, status: :unprocessable_entity
    end
  end

  # DELETE /periods/1
  def destroy
    @period.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_period
      @period = Period.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def period_params
      params.require(:period).permit(:name, :duration, :completion)
    end
end
