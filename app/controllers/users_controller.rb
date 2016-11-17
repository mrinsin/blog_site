class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  #When the login button is clicked, the server sends info here
  def login
    #find the user from the database using the provided email and load into instance variable
    @user = User.find_by_email(params[:login_email])

    #if this user exists in our database
    if !@user.nil?
      #Then check if the login password matches the password from the database
      if @user.password == params[:login_password]
        #save the logged in user in a cookie
        cookies[:user_id] = @user.id
        #send the logged in user to the welcome page
        redirect_to '/users/welcome' and return
      #otherwise, if th epasswirds don;t match
      else
        #alert the user and send them back to log in
        flash[:pass_notice] = 'Invalid password! Try again.'
        redirect_to '/' and return
      end #end of password condition

      #otherwise, if the user doesnt exist in the database
    else
      #othewrwise alert the user and send them back to log in
      flash[:email_notice] = "Invalid email! Try again."
      render :index
    end #end of email condition

  end

  def welcome
    @user = User.find(cookies[:user_id])
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :email, :password)
    end
end
