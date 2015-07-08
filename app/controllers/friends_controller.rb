class FriendsController < ApplicationController
  include CurrentUser
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all.where("user_id = ?",current_user.id)
    array_friends = []
    array_friends.append(current_user.id)
    @friends.each do |friend|
      array_friends.append(friend.friend_id)
    end
    @new_friends = User.all.where.not(id: array_friends)
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    puts params
    #@new_friends = current_user.friends.build(params)
    @new_friends = Friend.new
    @new_friends1 = Friend.new
    @new_friends.user_id = current_user.id
    @new_friends.friend_id = friend_params[:friend_id]
    @new_friends.friend_email = friend_params[:friend_email]
    
    @new_friends1.user_id = friend_params[:friend_id]
    @new_friends1.friend_id = current_user.id
    @new_friends1.friend_email = current_user.email
    
    respond_to do |format|
      if @new_friends.save and @new_friends1.save
        format.html { redirect_to friends_path, notice: 'Friend was successfully Added.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy 
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.permit(:friend_id,:friend_email)
    end
end
