class HsCardsController < ApplicationController

  before_action :set_hscard, only: [:show,:edit,:update, :destroy]
  before_filter :permission_method, :only => [:new, :edit, :create, :destroy]

  def index
    @filterrific = initialize_filterrific(
        HsCard,
        params[:filterrific],
        select_options: {
            sorted_by: HsCard.options_for_sorted_by,
            with_hs_class_name: HsClass.options_for_select,
            with_extension_name: Extension.options_for_select,
            with_rarity_name: Rarity.options_for_select,
            with_type_name: Type.options_for_select,
            with_group_name: Group.options_for_select
        },
        persistence_id: 'shared_key',
    ) or return

    @hscards = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return



    @hscards = HsCard.paginate(page: params[:page], per_page: 5)
                   .includes ([:hs_class, :rarity, :extension, :type, :group])


  end

  def show
    @hscard = HsCard.find params[:id]
    commontator_thread_show(@hscard)
  end

  def new
    @hscard = HsCard.new
  end

  def create
    @hscard = HsCard.new hscard_param
    if @hscard.save
      redirect_to @hscard
    end
  end

  def edit
  end

  def update
    if @hscard.update hscard_param
      redirect_to @hscard
    else
      render 'edit'
    end
  end

  def destroy
    @hscard.destroy
    redirect_to hs_cards_path
  end

  private

  def hscard_param
    params.require(:hs_card).permit(:name, :cost, :attack_points, :life_points, :description, :rarity_id, :hs_class_id, :extension_id, :type_id, :group_id, :picture)
  end

  def set_hscard
    @hscard = HsCard.find params[:id]
  end

  def permission_method
    authenticate_user!

    if current_user.admin
      return
    else
      flash[:danger] = "Vous n'avez pas le droit d'accéder à cette ressource"
      redirect_to hs_cards_url
    end
  end
end
