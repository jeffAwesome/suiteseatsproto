class GuestSeatsController < ApplicationController
  before_action :set_guest_seat, only: [:show, :edit, :update, :destroy]

  # GET /guest_seats
  # GET /guest_seats.json
  def index
    @guest_seats = GuestSeat.all
  end

  # GET /guest_seats/1
  # GET /guest_seats/1.json
  def show
  end

  # GET /guest_seats/new
  def new
    @guest_seat = GuestSeat.new
  end

  # GET /guest_seats/1/edit
  def edit
  end

  # POST /guest_seats
  # POST /guest_seats.json
  def create
    @guest_seat = GuestSeat.new(guest_seat_params)

    respond_to do |format|
      if @guest_seat.save
        format.html { redirect_to @guest_seat, notice: 'Guest seat was successfully created.' }
        format.json { render :show, status: :created, location: @guest_seat }
      else
        format.html { render :new }
        format.json { render json: @guest_seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guest_seats/1
  # PATCH/PUT /guest_seats/1.json
  def update
    respond_to do |format|
      if @guest_seat.update(guest_seat_params)
        format.html { redirect_to @guest_seat, notice: 'Guest seat was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest_seat }
      else
        format.html { render :edit }
        format.json { render json: @guest_seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_seats/1
  # DELETE /guest_seats/1.json
  def destroy
    @guest_seat.destroy
    respond_to do |format|
      format.html { redirect_to guest_seats_url, notice: 'Guest seat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest_seat
      @guest_seat = GuestSeat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_seat_params
      params.require(:guest_seat).permit(:user_id, :row, :seat, :section)
    end
end
