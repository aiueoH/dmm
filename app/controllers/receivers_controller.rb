class ReceiversController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_receiver, only: [:show, :edit, :update, :destroy]

  # GET /receivers
  # GET /receivers.json
  def index
    @receivers = Receiver.all
    if Rails.env.production?
      sql = "select * from receivers order by convert_to(name, 'BIG5');"
      @receivers = Receiver.find_by_sql(sql)
    else
      # Because sqlite3 does not support convert_to.
      @receivers = Receiver.all
    end
  end

  # GET /receivers/1
  # GET /receivers/1.json
  def show
  end

  # GET /receivers/new
  def new
    @receiver = Receiver.new
    @submit = "新增"
  end

  # GET /receivers/1/edit
  def edit
    @submit = "更新"
  end

  # POST /receivers
  # POST /receivers.json
  def create
    @receiver = Receiver.new(receiver_params)

    respond_to do |format|
      if @receiver.save
        format.html { redirect_to @receiver, notice:  "新增接收單位「#{@receiver.name}」" }
        format.json { render :show, status: :created, location: @receiver }
      else
        format.html { render :new }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receivers/1
  # PATCH/PUT /receivers/1.json
  def update
    respond_to do |format|
      if @receiver.update(receiver_params)
        format.html { redirect_to @receiver, notice:  "更新「#{@receiver.name}」資訊" }
        format.json { render :show, status: :ok, location: @receiver }
      else
        format.html { render :edit }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receivers/1
  # DELETE /receivers/1.json
  def destroy
    if @receiver.orders.size != 0
      respond_to do |format|
        format.html { redirect_to receivers_url, notice: '無法刪除該單位，此單位已領取過物品，若要刪除須先將領取記錄刪除。' }
        format.json { head :no_content }
      end
    else
      @receiver.destroy
      respond_to do |format|
        format.html { redirect_to receivers_url, notice:  "刪除接收單位「#{@receiver.name}」" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receiver
      @receiver = Receiver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receiver_params
      params.require(:receiver).permit(:name, :contact, :phone, :comment)
    end
end
