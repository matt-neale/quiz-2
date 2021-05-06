class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all.order(created_at: :DESC)
end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params

    if @idea.save
      flash[:notice] = "Idea created successfully!"
      redirect_to ideas_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    
  end

  def update
    @idea = Idea.find params[:id]
    if @idea.update idea_params
      flash[:notice] = "Idea updated"
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    if @idea.destroy 
      flash[:notice] = "Idea deleted"
      redirect_to ideas_path
    else
      render :show
    end
  end

  private 

  def idea_params
    params.require(:idea).permit(:title, :description) 
  end

  def find_idea
    @idea = Idea.find params[:id]
  end
end
