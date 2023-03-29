class BookroomsController < ApplicationController
  before_action :set_bookroom, only: %i[ show edit update destroy ]

  def index
    @bookrooms = Bookroom.all
  end

  def show
  end

  # GET /bookrooms/new
  def new
    @bookroom = Bookroom.new
  end

  def edit
  end

  def create
    @bookroom = Bookroom.new(bookroom_params)

    respond_to do |format|
      if @bookroom.save
        format.html { redirect_to bookroom_url(@bookroom), notice: "Your Room is successfully Booked." }
        format.json { render :show, status: :created, location: @bookroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bookroom.update(bookroom_params)
        format.html { redirect_to bookroom_url(@bookroom), notice: "Your Booking is successfully updated." }
        format.json { render :show, status: :ok, location: @bookroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bookroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookroom.destroy

    respond_to do |format|
      format.html { redirect_to bookrooms_url, notice: "Your Room is Canceled." }
      format.json { head :no_content }
    end
  end

  private
    def set_bookroom
      @bookroom = Bookroom.find(params[:id])
    end

    def bookroom_params
      params.require(:bookroom).permit(:first_name, :last_name, :email, :room_type, :no_of_rooms, :start_time, :end_time, :payment_type, :total_payment, :tip)
    end
end
