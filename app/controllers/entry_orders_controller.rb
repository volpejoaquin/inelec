class EntryOrdersController < ApplicationController
  before_action :set_entry_order, only: [:show, :edit, :update, :destroy]

  # GET /entry_orders
  # GET /entry_orders.json
  def index
    @entry_orders = EntryOrder.all
  end

  # GET /entry_orders/1
  # GET /entry_orders/1.json
  def show
  end

  # GET /entry_orders/new
  def new
    @entry_order = EntryOrder.new
  end

  # GET /entry_orders/1/edit
  def edit
  end

  # POST /entry_orders
  # POST /entry_orders.json
  def create
    @entry_order = EntryOrder.new(entry_order_params)

    respond_to do |format|
      if @entry_order.save
        format.html { redirect_to @entry_order, notice: 'Entry order was successfully created.' }
        format.json { render :show, status: :created, location: @entry_order }
      else
        format.html { render :new }
        format.json { render json: @entry_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entry_orders/1
  # PATCH/PUT /entry_orders/1.json
  def update
    respond_to do |format|
      if @entry_order.update(entry_order_params)
        format.html { redirect_to @entry_order, notice: 'Entry order was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry_order }
      else
        format.html { render :edit }
        format.json { render json: @entry_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_orders/1
  # DELETE /entry_orders/1.json
  def destroy
    @entry_order.destroy
    respond_to do |format|
      format.html { redirect_to entry_orders_url, notice: 'Entry order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_order
      @entry_order = EntryOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_order_params
      params.require(:entry_order).permit(:date, :number, :client_id, :comments)
    end
end
