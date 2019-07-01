class TargetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  def index
    @targets = Target.all
  end

  def show
  end
  
  def new
    @target = Target.new
  end
  
  def edit
  end
  
  def create
    @target = Target.new(target_params)

    respond_to do |format|
      if @target.save
        format.html { redirect_to targets_url, notice: '登録しました' }
        format.json { render :show, status: :created, location: @target }
      else
        format.html { render :new }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @target.update(target_params)
        format.html { redirect_to targets_url, notice: '更新しました' }
        format.json { render :show, status: :ok, location: @target }
      else
        format.html { render :edit }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @target.destroy
    respond_to do |format|
      format.html { redirect_to targets_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end
  
  private
  
    def set_target
      @target = Target.find(params[:id])
    end

    def target_params
      params.require(:target).permit(:year, :month, :user_id, :target_sales)
    end
  
end
