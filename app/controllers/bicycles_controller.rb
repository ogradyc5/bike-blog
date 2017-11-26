class BicyclesController < ApplicationController
  before_action :set_bicycle, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @bicycles = Bicycle.paginate(page: params[:page], per_page: 3)
  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end
  
  def require_same_user
    if current_user != @bicycle.user and !current_user.admin?
      flash[:danger] = "You can only update or delete personal items"
      redirect_to root_path
    end
  end 
  
  def new
    @bicycle = Bicycle.new
  end

  
  def edit
  end

  def create
    debugger
    @bicycle = Bicycle.new(bicycle_params)
    @bicycle.user = current_user
    respond_to do |format|
      if @bicycle.save
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully created.' }
        format.json { render :show, status: :created, location: @bicycle }
      else
        format.html { render :new }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bicycle.update(bicycle_params)
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @bicycle }
      else
        format.html { render :edit }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bicycle.destroy
    respond_to do |format|
      format.html { redirect_to bicycles_url, notice: 'Bicycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bicycle
      @bicycle = Bicycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bicycle_params
      params.require(:bicycle).permit(:title, :description, :price)
    end
end
