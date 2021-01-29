class PreOrdersController < ApplicationController
  before_action :set_pre_order, only: [:show, :edit, :update, :destroy]

  # GET /pre_orders
  # GET /pre_orders.json
  def index
    @pre_orders = PreOrder.all
  end

  # GET /pre_orders/1
  # GET /pre_orders/1.json
  def show
  end

  # GET /pre_orders/new
  def new
    @pre_order = PreOrder.new
  end

  # GET /pre_orders/1/edit
  def edit
  end

  # POST /pre_orders
  # POST /pre_orders.json
  def create
    @pre_order = PreOrder.new(pre_order_params)

    respond_to do |format|
      if @pre_order.save
        format.html { redirect_to @pre_order, notice: 'Pre order was successfully created.' }
        format.json { render :show, status: :created, location: @pre_order }
      else
        format.html { render :new }
        format.json { render json: @pre_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_orders/1
  # PATCH/PUT /pre_orders/1.json
  def update
    respond_to do |format|
      if @pre_order.update(pre_order_params)
        format.html { redirect_to @pre_order, notice: 'Pre order was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_order }
      else
        format.html { render :edit }
        format.json { render json: @pre_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_orders/1
  # DELETE /pre_orders/1.json
  def destroy
    @pre_order.destroy
    respond_to do |format|
      format.html { redirect_to pre_orders_url, notice: 'Pre order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_order
      @pre_order = PreOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pre_order_params
      params.require(:pre_order).permit(:tracking_id, :user_id)
    end
end
