module SubsHelper
  def require_moderator
    sub = Sub.find(params[:id])
    redirect_to subs_url unless sub.moderator_id == current_user.id
  end

  def sub_params
    params.require(:sub).permit(:name)
  end

  def link_params
    params.permit(link: [:title, :url, :text] )
          .require(:link)
          .values
          .reject{ |link| link.values.all?(&:blank?) }
          .map { |link| link.submitter_id = current_user.id }
  end
end
