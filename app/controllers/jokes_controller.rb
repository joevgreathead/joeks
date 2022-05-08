class JokesController < ApplicationController
  before_action :set_joke, only: %i[ show edit update destroy ]

  # GET /jokes or /jokes.json
  def index
    if params[:categories]
      @jokes = Joke.joins(:categories).where(categories: Category.where(id: params[:categories].split(",")))
    else
      @jokes = Joke.all.order(created_at: :desc)
    end
  end

  # GET /jokes/1 or /jokes/1.json
  def show
  end

  # GET /jokes/new
  def new
    @joke = Joke.new
  end

  # GET /jokes/1/edit
  def edit
  end

  # POST /jokes or /jokes.json
  def create
    @joke = Joke.new(joke_params)

    respond_to do |format|
      if @joke.save
        format.html { redirect_to jokes_path, notice: "[#{@joke.display_title}] was successfully created." }
        format.json { render :show, status: :created, location: @joke }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jokes/1 or /jokes/1.json
  def update
    respond_to do |format|
      if @joke.update(joke_params)
        format.html { redirect_to jokes_path, notice: "[#{@joke.display_title}] was successfully updated." }
        format.json { render :show, status: :ok, location: @joke }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jokes/1 or /jokes/1.json
  def destroy
    @joke.discard

    respond_to do |format|
      format.html { redirect_to jokes_url, notice: "Joke was successfully discarded." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joke
      @joke = Joke.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def joke_params
      params.require(:joke).permit(:title, :joke, category_ids: [])
    end
end
