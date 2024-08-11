# frozen_string_literal: true

class PetsController < ApplicationController
  before_action :set_pet, only: %i[show edit update destroy]
  before_action :set_breed_info, only: %i[show]
  before_action :set_users, only: %i[new edit create update]

  # GET /pets or /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1 or /pets/1.json
  def show; end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit; end

  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to pet_url(@pet), notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to pet_url(@pet), notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy!

    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pet
    @pet = Pet.find(params[:id])
  end

  def set_breed_info
    binding.pry
    @breed_info = @pet.is_dog? ? BreedDataService.new(breed_name: @pet.breed).call : nil

    return if @breed_info.nil?

    @description = @breed_info['attributes']['description']
    @lifespan = "#{@breed_info['attributes']['life']['min']} to #{@breed_info['attributes']['life']['max']}"
    @male_weight = "#{@breed_info['attributes']['male_weight']['min']} to #{@breed_info['attributes']['male_weight']['max']}"
    @female_weight = "#{@breed_info['attributes']['female_weight']['min']} to #{@breed_info['attributes']['female_weight']['max']}"
    @hypoallergenic = @breed_info['attributes']['hypoallergenic'] ? 'Yes' : 'No'
  end

  def set_users
    @users = User.all
  end

  # Only allow a list of trusted parameters through.
  def pet_params
    params.require(:pet).permit(:name, :kind, :breed, :user_id)
  end
end
