class ContactsController < ApplicationController
  before_action :set_company
  before_action :set_contact, only: [:edit, :update, :destroy]

  # GET /contacts/new
  def new
    @contact = @company.contacts.build
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = @company.contacts.build(contact_params)

      if @contact.save
        redirect_to(company_path(@contact.company), notice: 'Contact was successfully created.' )
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update_attributes(contact_params)
        format.html { redirect_to company_path(@contact.company), notice: 'Contact was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to company_path(@contact.company), notice: 'Contact was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:company_id])
    end
    
    def set_contact
      @contact = @company.contacts.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :phone_number, :cell_number, :email, :company_id)
    end
end
