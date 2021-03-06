class TimesheetsController < ApplicationController
  # GET /timesheets
  # GET /timesheets.xml
  def index
    @timesheets = Timesheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @timesheets }
    end
  end

  # GET /timesheets/1
  # GET /timesheets/1.xml
  def show
    @timesheet = Timesheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @timesheet }
    end
  end

  # GET /timesheets/new
  # GET /timesheets/new.xml
  def new
    @timesheet = Timesheet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @timesheet }
    end
  end

  # GET /timesheets/1/edit
  def edit
    @timesheet = Timesheet.find(params[:id])
  end

  # POST /timesheets
  # POST /timesheets.xml
  def create
    @timesheet = Timesheet.new(params[:timesheet])

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to(@timesheet, :notice => 'Timesheet was successfully created.') }
        format.xml  { render :xml => @timesheet, :status => :created, :location => @timesheet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @timesheet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /timesheets/1
  # PUT /timesheets/1.xml
  def update
    @timesheet = Timesheet.find(params[:id])

    respond_to do |format|
      if @timesheet.update_attributes(params[:timesheet])
        format.html { redirect_to(@timesheet, :notice => 'Timesheet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @timesheet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.xml
  def destroy
    @timesheet = Timesheet.find(params[:id])
    @timesheet.destroy

    respond_to do |format|
      format.html { redirect_to(timesheets_url) }
      format.xml  { head :ok }
    end
  end

  def start
   @timesheet = current_user.timesheets.build
    if @timesheet.save then
      flash[:notice] = "Time starts now!"
    else
      flash[:error] = "You already have a timesheet"
    end
    redirect_to root_url
  end

  def stop
    if current_user.has_open_timesheet?
      @projects = Project.unfinished.map{|x|
       [x.title, x.id]
      }
      @users = User.all.map{|x| [x.login,x.id] unless x.id==current_user.id}.compact
    else
      flash[:error] = "You do not have a current timesheet"
      redirect_to timesheets_path
    end
  end

  def stop_handler
    unless current_user.has_open_timesheet?
      flash[:error] = "You do not have a current timesheet"
      redirect_to root_url 
    else
      @timesheet = current_user.open_timesheet
      if params[:tasks]
        @timesheet.task_ids = params[:tasks]
        if @timesheet.end!
          flash[:notice] = "Successfully save your timesheet."
          if params[:pairing]
            @timesheet2 = @timesheet.clone
            @timesheet2.tasks = @timesheet.tasks
            @timesheet2.user_id = params[:partner_id]
            if @timesheet2.save
              flash[:notice] += "<br /> Create a timesheet for #{@timesheet2.user.login}"
              
            else
              flash[:error] += "Unable to make timesheet for your partner"
            end
          end
          redirect_to root_url
        end
      else
        @projects = Project.unfinished.map{|x|
         [x.title, x.id]
        }
        @users = User.all.map{|x| [x.login,x.id] unless x.id==current_user.id}.compact
        flash[:error] = "Must specify tasks worked on."
        render :action=>"stop"
      end
    end
  end
  
end
