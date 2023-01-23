class ListsController < ApplicationController
  before_action :set_list, only: %i[ edit update destroy ]

  # GET /lists or /lists.json
  def index
    @project = Project.find(params[:project_id])
    @lists = @project.lists
  end

  def edit
  end
  
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.turbo_stream
        format.html { redirect_to project_lists_url(@list.project), notice: "Todo was successfully created." }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@list)}_form", partial: "form", locals: { list: @list })
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@list)}_item", partial: "list",
                                                                                     locals: { list: @list })
        end
        format.html { redirect_to list_url(@list), notice: "Todo was successfully updated." }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@list)}_form", partial: "form",
                                                                                     locals: { list: @list })
        end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@list)}_item") }
      format.html { redirect_to lists_url, notice: "Todo was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:title, :status, :project_id)
    end
end
