class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    set_comment
  end

  # POST /comments or /comments.json
  def create
    puts "===== DEBUG PARAMS ====="
    puts params.inspect  # 🔥 Affiche les paramètres reçus dans la console
    puts "========================"
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.create(comment_params)
    @comment.gossip = @gossip
    @comment.user = current_user  # Associe le gossip à l'utilisateur anonyme

    if @comment.save
      flash[:success] = "Commentaire enregistré avec succès !"
      redirect_to @gossip, notice: "Commentaire ajouté avec succès !"
    else
      flash[:error] = "Le commentaire na pas pue etre ajouté ."
      puts params.inspect
      render new_session_path
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Le commentaire a été mis à jour avec succès."
      redirect_to @comment
    else
      flash[:error] = "La mise à jour a échoué."
      render :edit
    end
  end
  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!
    if @comment.destroy
      flash[:success] = "Le commentaire a été supprimé avec succès."
      redirect_to accueil_index_path, notice:
    else
      flash[:error] = "echec"
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
        params.require(:comment).permit(:content, :gossip_id, :user_id)
    end
end
