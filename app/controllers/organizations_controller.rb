class OrganizationsController < ApplicationController
  before_action :authorized
  before_action :admin_authorized, only: %i[ new create ]
  before_action :set_organization, only: %i[ show edit update destroy ]
  before_action only: %i[ edit update destroy ] do
    account_manager_authorized(@organization)
  end

  # GET /organizations or /organizations.json
  def index
    if params[:search]
      @organizations = Organization
        .joins(:people)
        .where("organizations.name OR people.name LIKE ?", "%#{Organization.sanitize_sql_like(params[:search])}%")
        .distinct
    else
      @organizations = Organization.all
    end
  end

  # GET /organizations/1 or /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations or /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to organization_url(@organization), notice: "Organization was successfully created." }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1 or /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to organization_url(@organization), notice: "Organization was successfully updated." }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1 or /organizations/1.json
  def destroy
    @organization.destroy!

    respond_to do |format|
      format.html { redirect_to organizations_url, notice: "Organization was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      whitelisted_params = [:name, :phone, :email, :website, :logo]
      whitelisted_params.push(:account_manager_id) if is_admin?

      params.require(:organization).permit(whitelisted_params)
    end
end
