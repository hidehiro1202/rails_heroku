class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
     @comment = Comment.new(user_id: current_user.id,topic_id: params[:comment][:topic_id],content: params[:comment][:content]  )
     if @comment.save
        redirect_to topics_path, success:'コメントしました'
     else
      flash.now[:danger] = "コメントできませんでした"
      render :new
     end
  end
end
