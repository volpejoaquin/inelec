module API
  class EntryOrdersController < ApiController
    before_action :set_order, only: [:edit, :update]
    before_action :set_client, only: [:index, :edit, :update]

    # GET /entry_orders.json
    def index
      @entry_orders = EntryOrder.where(client_id: params[:client_id])
    end

    # GET /entry_orders/1/edit
    def edit
    end

    # POST /entry_orders.json
    def create
      @entry_order = EntryOrder.new(entry_order_params)
      @entry_order.client_id = params[:client_id]

      if @entry_order.save
        render json: @entry_order, status: :created
      else
        render json: @entry_order.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /entry_orders/1.json
    def update
      if @entry_order.update(entry_order_params)
        render json: @entry_order, status: :ok
      else
        render json: @entry_order.errors, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = EntryOrder.find(params[:id])
      end

      def set_client
        @client = Client.find(params[:client_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def entry_order_params
        params.require(:entry_order).permit(:number, :datetime, :comments, :client_id)
      end
  end
end