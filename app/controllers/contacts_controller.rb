class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
    if request.format.to_s.eql? "application/json"
      render content_type: "application/javascript"
    else
      render content_type: request.format
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    
    if request.format.to_s.eql? "application/json"
      logger.info "es json"

      if @contact.save
        render action: 'show', :format => :json, content_type: "application/javascript"
      else
        render json: @contact.errors, status: :unprocessable_entity, :callback => params.require(:callback), content_type: "application/javascript"
      end

    else
      logger.info "no lo es"
      respond_to do |format|
        if @contact.save
          format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
          format.json { render action: 'show', status: :created, location: @contact }
        else
          format.html { render action: 'new' }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end

    end

  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :phone)
    end
end
