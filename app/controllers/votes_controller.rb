class VotesController < ApplicationController
    before_action :unvote
 def up
     
     @current_user.vote_for(voteable)
     redirect_to voteable, notice: "Your vote was recorded!"
 end

 def down
     

     @current_user.vote_against(voteable)
     redirect_to voteable, notice: "Your vote was recorded!"

 end


 def voteable
     if params[:post_id]
         return Post.find(params[:post_id])
     end

     if params[:comment_id]
         return Comment.find(params[:comment_id])
     end
 end

 def unvote
     if @current_user.voted_on?(voteable)
         @current_user.unvote_for(voteable)
     end
 end
end