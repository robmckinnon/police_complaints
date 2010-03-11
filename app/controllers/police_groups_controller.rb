class PoliceGroupsController < ApplicationController
  # GET /police_groups
  # GET /police_groups.xml
  def index
    @police_groups = PoliceGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @police_groups }
    end
  end

  # GET /police_groups/1
  # GET /police_groups/1.xml
  def show
    @police_group = PoliceGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @police_group }
    end
  end

  # GET /police_groups/new
  # GET /police_groups/new.xml
  def new
    @police_group = PoliceGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @police_group }
    end
  end

  # GET /police_groups/1/edit
  def edit
    @police_group = PoliceGroup.find(params[:id])
  end

  # POST /police_groups
  # POST /police_groups.xml
  def create
    @police_group = PoliceGroup.new(params[:police_group])

    respond_to do |format|
      if @police_group.save
        flash[:notice] = 'PoliceGroup was successfully created.'
        format.html { redirect_to(@police_group) }
        format.xml  { render :xml => @police_group, :status => :created, :location => @police_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @police_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /police_groups/1
  # PUT /police_groups/1.xml
  def update
    @police_group = PoliceGroup.find(params[:id])

    respond_to do |format|
      if @police_group.update_attributes(params[:police_group])
        flash[:notice] = 'PoliceGroup was successfully updated.'
        format.html { redirect_to(@police_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @police_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /police_groups/1
  # DELETE /police_groups/1.xml
  def destroy
    @police_group = PoliceGroup.find(params[:id])
    @police_group.destroy

    respond_to do |format|
      format.html { redirect_to(police_groups_url) }
      format.xml  { head :ok }
    end
  end
end
