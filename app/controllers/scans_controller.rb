class ScansController < ApplicationController

def index
  @scans = Scan.paginate(:page => params[:page], :per_page => 100)
end

def show
  @scan = Scan.find(params[:id])
end

end
