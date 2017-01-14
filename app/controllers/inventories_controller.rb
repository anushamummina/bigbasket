class InventoriesController < ApplicationController
  # load_and_authorize_resource
  before_filter :authenticate_user!
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inventories = Inventory.all
    @user_names_hash = Hash.new
    User.all.select("id, name").map{|x| @user_names_hash[x.id] = x.name}
    respond_with(@inventories)
  end

  def show
    respond_with(@inventory)
  end

  def new
    @inventory = Inventory.new
    @users = User.all
    respond_with(@inventory)
  end

  def edit
    @users = User.all
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.save
    redirect_to inventories_path, notice: "Inventory created successfully"
  end

  def update
    @inventory.update(inventory_params)
    redirect_to inventories_path, notice: "Inventory updated successfully"
  end

  def destroy
    @inventory.destroy
    respond_with(@inventory)
  end

  private
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def inventory_params
      params.require(:inventory).permit(:name, :quantity, :inventory_amount, :user_id)
    end
end
