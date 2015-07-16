class TransformersController < ApplicationController
  before_action :set_transformer, only: [:show, :edit, :update, :destroy]

  # GET /transformers
  # GET /transformers.json
  def index
    @transformers = Transformer.all
  end

  # GET /transformers/1
  # GET /transformers/1.json
  def show
  end

  # GET /transformers/new
  def new
    @transformer = Transformer.new
  end

  # GET /transformers/1/edit
  def edit
  end

  # POST /transformers
  # POST /transformers.json
  def create
    @transformer = Transformer.new(transformer_params)

    respond_to do |format|
      if @transformer.save
        format.html { redirect_to @transformer, notice: 'Transformer was successfully created.' }
        format.json { render :show, status: :created, location: @transformer }
      else
        format.html { render :new }
        format.json { render json: @transformer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transformers/1
  # PATCH/PUT /transformers/1.json
  def update
    respond_to do |format|
      if @transformer.update(transformer_params)
        format.html { redirect_to @transformer, notice: 'Transformer was successfully updated.' }
        format.json { render :show, status: :ok, location: @transformer }
      else
        format.html { render :edit }
        format.json { render json: @transformer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transformers/1
  # DELETE /transformers/1.json
  def destroy
    @transformer.destroy
    respond_to do |format|
      format.html { redirect_to transformers_url, notice: 'Transformer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transformer
      @transformer = Transformer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transformer_params
      params.require(:transformer).permit(:mark, :power, :number, :record_id, :diagnostic, :comments, :entry_order_id, :exit_order_id)
    end
end
