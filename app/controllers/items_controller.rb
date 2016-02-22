class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    if Rails.env.production?
      sql = "select * from items order by convert_to(name, 'BIG5');"
      @items = Item.find_by_sql(sql)
    else
      # Because sqlite3 does not support convert_to.
      @items = Item.all
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @submit = "新增"
  end

  # GET /items/1/edit
  def edit
    @submit = "更新"
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "新增「#{@item.name}」" }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "已更新「#{@item.name}」" }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    if @item.orders.size != 0
      respond_to do |format|
        format.html { redirect_to items_url, notice: '無法移除物品，該物品已有流向記錄，若要刪除請先刪除流向記錄。' }
        format.json { head :no_content }
      end
    else
      @item.destroy
      respond_to do |format|
        format.html { redirect_to items_url, notice: "已刪除「#{@item.name} 」" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :amount, :safety_stock)
    end
end
