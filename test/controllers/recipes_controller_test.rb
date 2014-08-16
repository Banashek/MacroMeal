require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post :create, recipe: { carbohydrates: @recipe.carbohydrates, cuisine_id: @recipe.cuisine_id, difficulty: @recipe.difficulty, directions: @recipe.directions, fat: @recipe.fat, high_protein: @recipe.high_protein, ingredients: @recipe.ingredients, low_fat: @recipe.low_fat, name: @recipe.name, protein: @recipe.protein, recipe_preference_id: @recipe.recipe_preference_id, recipe_type_id: @recipe.recipe_type_id }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should show recipe" do
    get :show, id: @recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe
    assert_response :success
  end

  test "should update recipe" do
    patch :update, id: @recipe, recipe: { carbohydrates: @recipe.carbohydrates, cuisine_id: @recipe.cuisine_id, difficulty: @recipe.difficulty, directions: @recipe.directions, fat: @recipe.fat, high_protein: @recipe.high_protein, ingredients: @recipe.ingredients, low_fat: @recipe.low_fat, name: @recipe.name, protein: @recipe.protein, recipe_preference_id: @recipe.recipe_preference_id, recipe_type_id: @recipe.recipe_type_id }
    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end
end
