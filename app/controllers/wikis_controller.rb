class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /wikis
  # GET /wikis.json
  def index
    @wikis = Wiki.all
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
    @wiki = Wiki.find(params[:id])
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
    @wiki  = Wiki.find(params[:id])
  end

  # POST /wikis
  # POST /wikis.json
  def create

    @wiki = current_user.wikis.new(wiki_params)

    respond_to do |format|
      if @wiki.save
        format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
        format.json { render :show, status: :created, location: @wiki }
      else
        format.html { render :new }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update
    respond_to do |format|
      if @wiki.update(wiki_params)
        authorize @wiki
        format.html { redirect_to @wiki, notice: 'Wiki was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiki }
      else
        format.html { render :edit }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the question."
      render :show
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.permit(:title, :body, :private)
    end

end
