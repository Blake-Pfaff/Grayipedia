class CollaboratorsController < ApplicationController
  before_action :set_wiki, only: [:index, :create]

  def index
    @users = User.all
  end


  def new
    @collaborator = Collaborator.new
    @user = User.all
    @wiki = Wiki.find(params[:wiki_id])
  end

  def show
     @collaborator = Collaborator.find(params[:wiki_id])
  end

  def create
    puts params[:wiki][:collaborators]
    # @wiki.collaborators = {'user_id' => []}.merge(params[:collaborators] || {})
    #@wiki.users << User.where(id: params[:wiki][:collaborators])
    params[:wiki][:collaborators].each do |user_id|
      # Create a new Collaborator record with @wiki.id and user_id
      Collaborator.find_or_create_by(
        wiki_id: @wiki.id,
        user_id: user_id
      )
    end

    @wiki.save!
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new(user_id: params[:user_id], wiki_id: params[:wiki_id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed from wiki."
      redirect_to @wiki
    else
      flash[:error] = "There was an error deleting this collaborator. Please try again."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:wiki_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.reaquire(:wiki).permit(:collaborators)
    end

end
