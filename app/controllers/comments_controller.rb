class CommentsController < ApplicationController
  before_action :set_topic

  

    # Create / Post
  

  def new
    @comments = Commment.new
  end
  
  def create
    @comment = @topic.comments.new(comment_params)

    if @comment.save
      redirect_to [@topic, @comment]
    else
      render :new
    end
  end

  private 
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    # model_name_params
    # private 
    #   def model_name_params
    #     params.require(:model_name).permit(:everything the model has,)
    #   end
    def comment_params
      params.require(:comment).permit(:body, :author)
    end
end
