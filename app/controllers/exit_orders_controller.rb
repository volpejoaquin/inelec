class ExitOrdersController < ApplicationController
  before_action :set_exit_order, only: [:show, :edit, :update, :destroy]

  # GET /exit_orders
  # GET /exit_orders.json
  def index
    @exit_orders = ExitOrder.all
  end

  # GET /exit_orders/1
  # GET /exit_orders/1.json
  def show
  end

  # GET /exit_orders/new
  def new
    @exit_order = ExitOrder.new
  end

  # GET /exit_orders/1/edit
  def edit
  end

  # POST /exit_orders
  # POST /exit_orders.json
  def create
    @exit_order = ExitOrder.new(exit_order_params)

    respond_to do |format|
      if @exit_order.save
        format.html { redirect_to @exit_order, notice: 'Exit order was successfully created.' }
        format.json { render :show, status: :created, location: @exit_order }
      else
        format.html { render :new }
        format.json { render json: @exit_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exit_orders/1
  # PATCH/PUT /exit_orders/1.json
  def update
    respond_to do |format|
      if @exit_order.update(exit_order_params)
        format.html { redirect_to @exit_order, notice: 'Exit order was successfully updated.' }
        format.json { render :show, status: :ok, location: @exit_order }
      else
        format.html { render :edit }
        format.json { render json: @exit_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exit_orders/1
  # DELETE /exit_orders/1.json
  def destroy
    @exit_order.destroy
    respond_to do |format|
      format.html { redirect_to exit_orders_url, notice: 'Exit order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exit_order
      @exit_order = ExitOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exit_order_params
      params.require(:exit_order).permit(:date, :number, :client_id, :comments)
    end
end
