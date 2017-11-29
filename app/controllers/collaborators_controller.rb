class CollaboratorsController < ApplicationController
  before_action :set_wiki, only: [:index, :create, :destroy]

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
    collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])

    if collaborator.save
      flash[:success] = "Collaborator added to wiki."
      redirect_to wiki_collaborators_path(@wiki)
    else
      flash[:error] = "There was an error deleting this collaborator. Please try again."
    end
  end

  def destroy
    collaborator = Collaborator.find_by(user_id: params[:user_id], wiki_id: @wiki.id)

    if collaborator.delete
      flash[:success] = "Collaborator removed from wiki."
      redirect_to wiki_collaborators_path(@wiki)
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
