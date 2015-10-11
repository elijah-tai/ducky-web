class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @requests = Request.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    if current_user
      Analytics.track({
        user_id: current_user.id,
        user_name: current_user.name, 
        event: 'Visited Groups Index', 
        properties: {
      }
      })
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    if current_user
      Analytics.track({
        user_id: current_user.id,
        user_name: current_user.name,
        event: 'Visited Group',
        properties: {
          group_name: @group.name
        } 
      })
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
    if current_user
      Analytics.track({
        user_id: current_user.id,
        user_name: current_user.name,
        event: 'Group Creation Initiated',
        properties: {
        }
        })
    end
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.add(current_user)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
        if current_user
          Analytics.track({
            user_id: current_user.id,
            user_name: current_user.name,
            event: 'Group Created',
            properties: {
              group_name: @group.name
            }
            })
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name)
    end
end
