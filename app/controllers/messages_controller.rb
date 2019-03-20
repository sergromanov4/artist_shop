class MessagesController < ApplicationController
  before_action :authenticate_user!, except:[:new]

  before_action :find_order, only: [:new, :create]

  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def new
    @message = @order.messages.build()
    #@message = Message.new(order_id: params[:order_id]) 
    #@order.messages.build	
  end

  def create
    @message = @order.messages.build(message_params)
    #@message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to order_path(@message.order_id), 
                      notice: t('.notice') }
      else
        format.html { render :new }
      end
    end
  end

  private

    def find_order
      @order = current_user.orders.find_by(id: params[:order_id])
    end

    def set_message
      @message = current_user.messages.find_by(id: params[:id])
      # @message = Message.find_by(id: params[:id])
    end

    def message_params
      params.require(:message).permit( :name, :text )
    end
end
