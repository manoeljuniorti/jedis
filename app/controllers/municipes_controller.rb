class MunicipesController < ApplicationController
  require "cpf_cnpj"
  before_action :set_municipe, only: %i[ show edit update destroy ]

  VALIDATE_PARAMS = [
    ['cpf', 'cpf_valid?'],
    ['cns', 'cns_valid?'],
    ['birth_date', 'birth_date_valid?'],
  ].freeze

  # GET /municipes or /municipes.json
  def index
    @municipes = Municipe.all
  end

  # GET /municipes/1 or /municipes/1.json
  def show
  end

  # GET /municipes/new
  def new
    @municipe = Municipe.new
  end

  # GET /municipes/1/edit
  def edit
  end

  # POST /municipes or /municipes.json
  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        format.html { redirect_to municipe_url(@municipe), notice: "Municipe was successfully created." }
        format.json { render :show, status: :created, location: @municipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipes/1 or /municipes/1.json
  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        format.html { redirect_to municipe_url(@municipe), notice: "Municipe was successfully updated." }
        format.json { render :show, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipes/1 or /municipes/1.json
  def destroy
    @municipe.destroy

    respond_to do |format|
      format.html { redirect_to municipes_url, notice: "Municipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipe
      @municipe = Municipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def municipe_params
      params.require(:municipe).permit(:name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status)
    end

    def cpf_valid?
      CPF.valid?(params[:cpf]) && !params[:cpf].match?(/[^0-9]/)
    end

    def cns_valid?
      params[:cns].match?(/[^0-9]/)
    end

    def birth_date_valid?
      params[:birth_date].to_date
      params[:birth_date].match?(/[0-9]{2}-[0-9]{2}-[0-9]{4}/) && params[:birth_date].length == 10
    end
end
