class InvestmentTypesController < ApplicationController
  before_action :set_investment_type, only: %i[ show edit update destroy ]

  # GET /investment_types or /investment_types.json
  def index
    @investment_types = InvestmentType.all
  end

  # GET /investment_types/1 or /investment_types/1.json
  def show
  end

  # GET /investment_types/new
  def new
    @investment_type = InvestmentType.new
  end

  # GET /investment_types/1/edit
  def edit
  end

  # POST /investment_types or /investment_types.json
  def create
    @investment_type = InvestmentType.new(investment_type_params)

    respond_to do |format|
      if @investment_type.save
        format.html { redirect_to @investment_type, notice: "Investment type was successfully created." }
        format.json { render :show, status: :created, location: @investment_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @investment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investment_types/1 or /investment_types/1.json
  def update
    respond_to do |format|
      if @investment_type.update(investment_type_params)
        format.html { redirect_to @investment_type, notice: "Investment type was successfully updated." }
        format.json { render :show, status: :ok, location: @investment_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @investment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investment_types/1 or /investment_types/1.json
  def destroy
    @investment_type.destroy
    respond_to do |format|
      format.html { redirect_to investment_types_url, notice: "Investment type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment_type
      @investment_type = InvestmentType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def investment_type_params
      params.require(:investment_type).permit(:name, :description)
    end
end
