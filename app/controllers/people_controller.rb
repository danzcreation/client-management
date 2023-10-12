class PeopleController < ApplicationController
  before_action :authorized
  before_action :set_person, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ new create ]
  before_action only: %i[ new create edit update destroy ] do
    account_manager_authorized(@organization || @person.organization)
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = @organization.people.build
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = @organization.people.build(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to organization_url(@person.organization), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to organization_url(@person.organization), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy!

    respond_to do |format|
      format.html { redirect_to organization_url(@person.organization), notice: "Person was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find_by(organization_id: params[:organization_id], id: params[:id])
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:organization_id, :name, :email, :phone, :avatar)
    end
end
