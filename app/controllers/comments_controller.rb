class CommentsController < ApplicationController
    
    def create
        @player = Player.find(params[:player_id])
        @comment = @player.comments.build(comment_params)
        @comment.user = Current.user
      
        if @comment.save
          redirect_to player_path(@player), notice: 'Comment was successfully created.'
        else
          redirect_to player_path(@player), alert: 'Error creating comment.'
        end
    end
      

    def destroy 
        @player = Player.find(params[:player_id])
        @comment =@player.comments.find(params[:id])
        @comment.destroy
        redirect_to player_path(@player)
    end 
end
private
      
      def comment_params
        params.require(:comment).permit(:body)
      end