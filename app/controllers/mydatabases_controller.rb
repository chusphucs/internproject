class MydatabasesController < ApplicationController
  before_action :set_mydatabase, only: %i[ show edit update destroy ]

  def index
    @mydatabases = Mydatabase.all
  end

  def show
  end

  def new
    @mydatabase = Mydatabase.new
  end

  def edit
  end

  def create
    @mydatabase = Mydatabase.new(mydatabase_params)

    respond_to do |format|
      if @mydatabase.save
        format.html { redirect_to mydatabase_url(@mydatabase), notice: "Mydatabase was successfully created." }
        format.json { render :show, status: :created, location: @mydatabase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mydatabase.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mydatabase.update(mydatabase_params)
        format.html { redirect_to mydatabase_url(@mydatabase), notice: "Mydatabase was successfully updated." }
        format.json { render :show, status: :ok, location: @mydatabase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mydatabase.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mydatabase.destroy

    respond_to do |format|
      format.html { redirect_to mydatabases_url, notice: "Mydatabase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_mydatabase
      @mydatabase = Mydatabase.find(params[:id])
    end

    def mydatabase_params
      params.require(:mydatabase).permit(:first_name, :last_name, :email, :room_type, :no_of_rooms, :start_time, :end_time, :payment_type, :total_payment, :tip)
    end
end
