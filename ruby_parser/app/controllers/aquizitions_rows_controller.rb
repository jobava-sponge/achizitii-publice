class AquizitionsRowsController < ApplicationController
  before_action :set_aquizitions_row, only: [:show, :edit, :update, :destroy]

  # GET /aquizitions_rows
  # GET /aquizitions_rows.json
  def index
    @aquizitions_rows = AquizitionsRow.all
  end

  # GET /aquizitions_rows/1
  # GET /aquizitions_rows/1.json
  def show
  end

  # GET /aquizitions_rows/new
  def new
    @aquizitions_row = AquizitionsRow.new
  end

  # GET /aquizitions_rows/1/edit
  def edit
  end

  # POST /aquizitions_rows
  # POST /aquizitions_rows.json
  def create
    @aquizitions_row = AquizitionsRow.new(aquizitions_row_params)

    respond_to do |format|
      if @aquizitions_row.save
        format.html { redirect_to @aquizitions_row, notice: 'Aquizitions row was successfully created.' }
        format.json { render action: 'show', status: :created, location: @aquizitions_row }
      else
        format.html { render action: 'new' }
        format.json { render json: @aquizitions_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aquizitions_rows/1
  # PATCH/PUT /aquizitions_rows/1.json
  def update
    respond_to do |format|
      if @aquizitions_row.update(aquizitions_row_params)
        format.html { redirect_to @aquizitions_row, notice: 'Aquizitions row was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aquizitions_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aquizitions_rows/1
  # DELETE /aquizitions_rows/1.json
  def destroy
    @aquizitions_row.destroy
    respond_to do |format|
      format.html { redirect_to aquizitions_rows_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aquizitions_row
      @aquizitions_row = AquizitionsRow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aquizitions_row_params
      params.require(:aquizitions_row).permit(:file_lines, :id)
    end
end
