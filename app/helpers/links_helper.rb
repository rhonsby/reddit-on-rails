module LinksHelper
  def require_submitter
    @link = Link.find(params[:id])
    redirect_to link_url(@link) unless @link.submitter_id = current_user.id
  end

  def link_params
    params.require(:link).permit(:title, :url, :text, parent_sub_ids: [])
  end

  def create_vote(bool)
    @vote = UserVote.new(
      user_id: current_user.id,
      link_id: params[:id],
      upvote: bool
    )

    flash[:errors] = ["Sorry, I didn't register that vote"] unless @vote.save
    redirect_to link_url(@vote.link)
  end
end
