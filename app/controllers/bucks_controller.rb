class BucksController < ApplicationController
  before_action :set_buck, only: %i[ show edit update destroy ]

  # GET /bucks or /bucks.json
  def index
    @bucks = Buck.all
  end

  # GET /bucks/1 or /bucks/1.json
  def show
  end

  # GET /bucks/new
  def new
    @buck = Buck.new
  end

  # GET /bucks/1/edit
  def edit
  end

  # POST /bucks or /bucks.json
  def create
    @buck = Buck.new(buck_params)

    respond_to do |format|
      if @buck.save
        format.html { redirect_to project_bucket_url(@buck.bucket.project, @buck.bucket) }
        format.json { render :show, status: :created, location: @buck }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bucks/1 or /bucks/1.json
  def update
    respond_to do |format|
      if @buck.update(buck_params)
        format.html { redirect_to buck_url(@buck), notice: "Buck was successfully updated." }
        format.json { render :show, status: :ok, location: @buck }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bucks/1 or /bucks/1.json
  def destroy
    @buck.destroy

    respond_to do |format|
      format.html { redirect_to project_bucket_url(@buck.bucket.project, @buck.bucket) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buck
      @buck = Buck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buck_params
      params.require(:buck).permit(:name, :bucket_id)
    end
end
