class SubsController < ApplicationController
  # Views user interaction, logic at minimum
  # Controller / routes directing traffic, actions
  # Models all logic on the table / record

  # Skinny Controllers / Fat Models

    # Read / GET
    #   shows all of the items in the model
    #   index @model_names = Model_name.all

    #   search record to update / render edit form
    #   edit @model_name = Model_name.find(params[:id])

    #   search record / shows a specific record
    #   show @model_name = Model_name.find(params[:id])

    #   creates record in memory / rendering the new form
    #   new @model_name = Model_name.new

    # Create / Post
    # create Model_name.create(model_name_params)
          # @model_name = Model_name.new(model_name_params)

          # if @model_name.save
          #   do something
          # else
          #   render :new
          # end
    # Update / Put/patch
    # update  Model_name.find(params[:id]).update(model_name_params)
    
    # @model_name =  Model_name.find(params[:id])
    # if @model_name.update(model_name_params)
    #   do something
    # else
    #   render :edit
    # end

    # Destroy / Delete
    # destroy Model_name.find(params[:id]).destroy

    # model_name_params
    # private 
    #   def model_name_params
    #     params.require(:model_name).permit(:everything the model has,)
    #   end

    # callbacks 
    # before_action
    # after_action
    # skip_before_action
    # skip_after_action

  before_action :find_sub, only: [:show, :update, :edit, :destroy]
  # before_action :find_sub, except: [:index, :new, :create]

  #get
  def index
    @subs = Sub.all
    # render index.html
  end

  #get
  def show
    # render show.html.erb
  end

  #get
  def new
    @sub = Sub.new
    # render new.html.erb

    render partial: 'subs/form'
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  #get
  def edit
    # render edit.html.erb

    render partial: 'subs/form'
  end

  def update
    if @sub.update(sub_params)
      redirect_to @sub
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end
 
  private

    def sub_params
      params.require(:sub).permit(:name)
    end

    def find_sub
      @sub = Sub.find(params[:id])
    end
  
end
