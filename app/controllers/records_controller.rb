class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @q = Record.ransack(params[:q])
    @records = @q.result(distinct: true)
    @total_sales = @records.sum(:sales)
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = Record.new
    @users = User.all
  end

  # GET /records/1/edit
  def edit
    @users = User.all
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to records_url, notice: '登録しました' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to records_url, notice: '更新しました' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end
  
  def fulfillment
    @records = Record.where(status: "成約")
    @total_sales = @records.sum(:sales)
  end
  
  def closed
    @records = Record.where(status: "終了")
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:candidate, :candidate_id, :status, :sales, :user_id,
      entries_attributes:[:user_id, :candidate_id, :client, :entry_status, :interview_day, :expected_sales, :rank])
    end
end
