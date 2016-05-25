class HsClassesController < ApplicationController
  before_action :set_hs_class, only: [:show, :edit, :update, :destroy]
  before_filter :permission_method, :only => [:new, :edit, :create, :destroy]


  # GET /hs_classes
  # GET /hs_classes.json
  def index
    @hs_classes = HsClass.all
  end

  # GET /hs_classes/1
  # GET /hs_classes/1.json
  def show
  end

  # GET /hs_classes/new
  def new
    @hs_class = HsClass.new
  end

  # GET /hs_classes/1/edit
  def edit
  end

  # POST /hs_classes
  # POST /hs_classes.json
  def create
    @hs_class = HsClass.new(hs_class_params)

    respond_to do |format|
      if @hs_class.save
        format.html { redirect_to @hs_class, notice: 'La classe a bien été créée' }
        format.json { render :show, status: :created, location: @hs_class }
      else
        format.html { render :new }
        format.json { render json: @hs_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hs_classes/1
  # PATCH/PUT /hs_classes/1.json
  def update
    respond_to do |format|
      if @hs_class.update(hs_class_params)
        format.html { redirect_to @hs_class, notice: 'La classe a bien été modifiée' }
        format.json { render :show, status: :ok, location: @hs_class }
      else
        format.html { render :edit }
        format.json { render json: @hs_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hs_classes/1
  # DELETE /hs_classes/1.json
  def destroy
    @hs_class.destroy
    respond_to do |format|
      format.html { redirect_to hs_classes_url, notice: 'La classe a bien été détruite' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hs_class
      @hs_class = HsClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hs_class_params
      params.require(:hs_class).permit(:name, :color, :hero_power)
    end
  def permission_method
    authenticate_user!

    if current_user.admin
      return
    else
      flash[:danger] = "Vous n'avez pas le droit d'accéder à cette ressource"
      redirect_to hs_classes_url
    end
  end
end
