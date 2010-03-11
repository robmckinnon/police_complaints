# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'uri'
require 'morph'

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def render_not_found message='Page not found.'
    @title = "Page cannot be found (404 error)"
    @crumbtrail = "Error: page cannot be found"
    render :template => 'public/404.html', :status => 404
  end

  def home
  end
  
  def search
    postcode = params[:postcode]
    url = "http://policeapi.rkh.co.uk/api/geocode-crime-area?key=rewiredcrime&q="+postcode
    url = URI.encode(url)
    response = RestClient.get url
    xml = response.to_s
    data = Hash.from_xml(xml)
    m = Morph.from_hash data
    area_id = m.response.areas.areas[1].area_id
    
    url = "http://policeapi.rkh.co.uk/api/crime-area?key=rewiredcrime&force=metropolitan&area="+area_id
    url = URI.encode(url)
    response = RestClient.get url
    xml = response.to_s
    data = Hash.from_xml(xml)
    m = Morph.from_hash data
    name = m.response.name
    
    group = PoliceGroup.find_by_name(name)
    
    redirect_to :controller => 'police_group', :action => 'show', :id => group.id
  end
end
