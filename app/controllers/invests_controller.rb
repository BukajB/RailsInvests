class InvestsController < ApplicationController
  before_action :set_invest, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :correct_user, only: [ :edit, :update, :destroy ]
  # GET /invests or /invests.json
  def index
    @invests = Invest.all
  end

  # GET /invests/1 or /invests/1.json
  def show
  end

  # GET /invests/new
  def new
    # @invest = Invest.new
    @invest = current_user.invests.build
  end

  # GET /invests/1/edit
  def edit
  end

  # POST /invests or /invests.json
  def create
    # @invest = Invest.new(invest_params)
    @invest = current_user.invests.build(invest_params)

    respond_to do |format|
      if @invest.save
        format.html { redirect_to invest_url(@invest), notice: "Invest was successfully created." }
        format.json { render :show, status: :created, location: @invest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invests/1 or /invests/1.json
  def update
    respond_to do |format|
      if @invest.update(invest_params)
        format.html { redirect_to invest_url(@invest), notice: "Invest was successfully updated." }
        format.json { render :show, status: :ok, location: @invest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invests/1 or /invests/1.json
  def destroy
    @invest.destroy

    respond_to do |format|
      format.html { redirect_to invests_url, notice: "Invest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @invest = current_user.invests.find_by(id: params[:id])
    redirect_to invests_path, notice: "Not Authorized To Edit This Invest" if @invest.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invest
      @invest = Invest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invest_params
      params.require(:invest).permit(:asset_name, :bought_amount, :buy_price, :buy_fees, :total_input, :sold_amount, :sell_price, :sell_fees, :total_output, :user_id)
    end
end
