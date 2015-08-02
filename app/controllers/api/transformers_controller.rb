module API
  class TransformersController < ApiController
    before_action :set_transformer, only: [:edit, :update]

    # GET /transformers.json
    def index
      @transformers = Transformer.where(entry_order_id: params[:entry_order_id], exit_order_id: params[:exit_order_id])
    end

    # GET /transformers/1/edit
    def edit
    end

    # POST /transformers.json
    def create
      @transformer = Transformer.new(transformer_params)
      @transformer.entry_order = params[:entry_order_id]
      @transformer.exit_order = params[:exit_order_id]

      if @transformer.save
        render json: @transformer, status: :created
      else
        render json: @transformer.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /transformers/1.json
    def update
      if @transformer.update(transformer_params)
        render json: @transformer, status: :ok
      else
        render json: @transformer.errors, status: :unprocessable_entity
      end
    end

    private
      def set_entry_order
        @entry_order = EntryOrder.find(params[:entry_order_id])
        @exit_order = EntryOrder.find(params[:exit_order_id])
      end

      def set_transformer
        @transformer = Transformer.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def transformer_params
        params.require(:transformer).permit(:mark, :power, :number, :diagnostic, :comments, :entry_order_id, :exit_order_id)
      end
  end
end