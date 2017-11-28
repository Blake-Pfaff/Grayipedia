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
    puts params
    @wiki.collaborators = {'user_id' => []}.merge(params[:collaborators] || {})
    @wiki.save!
  end

  def destroy
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
