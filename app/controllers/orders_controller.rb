class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    
    if Rails.env.production?
      sql_item = "select * from items order by convert_to(name, 'BIG5');"
      sql_receivers = "select * from receivers order by convert_to(name, 'BIG5');"
      @items = Item.find_by_sql(sql_item)
      @receivers = Receiver.find_by_sql(sql_receivers)
    else
      # Because sqlite3 does not support convert_to.
      @items = Item.all
      @receivers = Receiver.all
    end
  
    @submit = "新增"
  end

  # GET /orders/1/edit
  def edit
    @submit = "更新"
  end

  # POST /orders
  # POST /orders.json
  def create
    # 訂單新增時，檢查庫存是否足夠，並扣除
    item = Item.find(order_params[:item_id])
    want = order_params[:amount].to_i
    if item != nil && item.amount - item.safety_stock >= want
      item.amount -= want
      item.save
      @order = Order.new(order_params)
      respond_to do |format|
        if @order.save
          format.html { redirect_to @order, notice: '已將物品順利送出。' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    else
      @order = Order.new(order_params)
      respond_to do |format|
        format.html { render :new, notice: '物品庫存不足' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "更新「#{@order.name}」" }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    # 訂單刪除時，將物品庫存復原
    item = @order.item
    item.amount += @order.amount
    item.save
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: '已刪除該送出記錄，物品數量補回。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:comment, :receiver_id, :item_id, :amount)
    end
end
