class ListItemsController < ApplicationController
  before_action :set_bill
  before_action :set_list_item, only: %i[ show edit update destroy ]

  # GET /list_items or /list_items.json
  def index
    @list_items = @bill.list_items.recent
  end

  # GET /list_items/1 or /list_items/1.json
  def show
  end

  # GET /list_items/new
  def new
    @list_item = @bill.list_items.build
  end

  # GET /list_items/1/edit
  def edit
  end

  # POST /list_items or /list_items.json
  def create
    @list_item = @bill.list_items.build(list_item_params)

    respond_to do |format|
      if @list_item.save
        format.turbo_stream { flash.now[:notice] = "List item was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_items/1 or /list_items/1.json
  def update
    respond_to do |format|
      if @list_item.update(list_item_params)
        format.turbo_stream { flash.now[:notice] = "List item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1 or /list_items/1.json
  def destroy
    @list_item.destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Bill was successfully destroyed." }
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:bill_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_list_item
    @list_item = ListItem.where(id: params[:id], bill_id: params[:bill_id]).first
  end

  # Only allow a list of trusted parameters through.
  def list_item_params
    params.require(:list_item).permit(:bill_id, :quantity, :amount, :name)
  end
end
