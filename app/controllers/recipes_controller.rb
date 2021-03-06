class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    if params.has_key? :recipe_name
      @recipes = Recipe.advancedSearch(params[:recipe_name],
                                       params[:min_p],
                                       params[:max_p],
                                       params[:min_c],
                                       params[:max_c],
                                       params[:min_f],
                                       params[:max_f])
    else
      @recipes = Recipe.search(params[:search])
    end
    @myRecipes = Recipe.myRecipes(current_user.id) if current_user
  end

  def search
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @myRecipes = Recipe.myRecipes(current_user.id) if current_user
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    recipeOwnerCheck
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    recipeOwnerCheck
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    recipeOwnerCheck
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipeOwnerCheck
      @r = Recipe.where('id = ?', params[:id]).pluck(:user_id)[0]
      redirect_to recipes_path unless @r == current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :recipe_type_id, :recipe_preference_id, :cuisine_id, :high_protein, :low_fat, :protein, :carbohydrates, :fat, :difficulty, :ingredients, :directions)
    end
end
