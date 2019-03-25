class OrdersController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  before_action :set_order, only: [:show, :edit, :update, :destroy, 
                                   :click_to_work, :click_to_complete, :upload_image ]

  def index
    if params[:locale] 
      redirect_to root_url(locale: params[:set_locale])
    else
      @orders = Order.all
    end
    
  end

  def show
  end

  def new
    @order = current_user.orders.build
  end

  def edit
  end

  def create
    @order = current_user.orders.build(order_params)
     
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: t('.notice')}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: t('.notice')}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  def click_to_work
    @order.state_to_work
    redirect_to @order
  end

  def click_to_complete
    @order.state_to_completed
    redirect_to @order
  end

  def upload_image
    data = open(@order.painted_picture.url) 
    send_data data.read
  end

  private

    def set_order
      @order = current_user.orders.find_by(id: params[:id])
      redirect_to root_path, not_found: t('.not_found') unless @order
    end

    def order_params
      params.require(:order).permit(:title, :description, :price, 
                                    :image_for_order, :painted_picture )
    end
end
