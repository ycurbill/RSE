class IndicatorsListsController < ApplicationController
  before_action :set_indicators_list, only: %i[ show update destroy ]

  # GET /indicators_lists
  def index
    @indicators_lists = IndicatorsList.all

    render json: @indicators_lists
  end

  # GET /indicators_lists/1
  def show
    render json: @indicators_list
  end

  # POST /indicators_lists
  def create
    @indicators_list = IndicatorsList.new(indicators_list_params)

    if @indicators_list.save
      render json: @indicators_list, status: :created, location: @indicators_list
    else
      render json: @indicators_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /indicators_lists/1
  def update
    if @indicators_list.update(indicators_list_params)
      render json: @indicators_list
    else
      render json: @indicators_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /indicators_lists/1
  def destroy
    @indicators_list.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicators_list
      @indicators_list = IndicatorsList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def indicators_list_params
      params.require(:indicators_list).permit(:name, :precision)
    end
end
