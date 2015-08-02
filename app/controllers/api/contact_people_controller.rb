module API
  class ContactPeopleController < ApiController
    before_action :set_contact, only: [:edit, :update]
    before_action :set_client, only: [:index, :edit, :update]

    # GET /contact_people.json
    def index
      @contact_people = ContactPerson.where(client_id: params[:client_id])
    end

    # GET /contact_people/1/edit
    def edit
    end

    # POST /contact_people.json
    def create
      @contact = ContactPerson.new(contact_params)
      @contact.client_id = params[:client_id]

      if @contact.save
        render json: @contact, status: :created
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contact_people/1.json
    def update
      if @contact.update(contact_params)
        render json: @contact, status: :ok
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = ContactPerson.find(params[:id])
      end

      def set_client
        @client = Client.find(params[:client_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def contact_params
        params.require(:contact_person).permit(:name, :email, :phone, :position, :decision_maker, :client_id)
      end
  end
end