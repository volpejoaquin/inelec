module API
  class ClientsController < ApiController
    before_action :set_decorated_client, only: [:show]
    before_action :set_client, only: [:edit, :update]
    helper_method :sort_column, :sort_direction

    # GET /clients.json
    def index
      @clients = get_clients.decorate
    end

    # GET /clients/1.json
    def show
    end

    # GET /clients/new
    def new
      respond_with Client.new
    end

    # GET /clients/1/edit
    def edit
    end

    # POST /clients.json
    def create
      params = client_params
      @client = Client.new(params)

      if @client.save
        render json: @client, status: :created
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /clients/1.json
    def update
      if @client.update(client_params)
        render json: @client, status: :ok
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    # POST /add_contact
    def add_contact
      params = contact_params

      @contact = Contact.new(contact_params)
      @contact.client_id = params[:client_id]

      if @contact.save
        render json: @contact, status: :created
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # Gets all possible categories
    def categories
      respond_with Client.categories.collect.with_index { |category, index| {id: index, name: category} }
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_client
        @client = Client.find(params[:id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_decorated_client
        @client = set_client.decorate
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def client_params
        params.require(:client).permit(:name, :address, :city, :category_id, :postal_code, :phone, :email, :cuit)
      end

      def contact_params
        params.require(:contact).permit(:name, :client_id)
      end

      def get_clients
        Client.search(params[:field], params[:term]).order(sort_column + " " + sort_direction)
      end

      def sort_column
        Client.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
  end
end