# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'uri'
require 'morph'
require 'hpricot'
require 'rest_client'

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
    url = "http://maps.met.police.uk/php/lookup.php?pcode="+postcode
    point = morph_request(url).centre_points.first
    
    url = "http://maps.met.police.uk/php/lookup.php?minlat=#{point.lat}&minlng=#{point.lng}&maxlat=#{point.lat}&maxlng=#{point.lng}&level=4&CTID=8"
    area_code = morph_request(url).areas.first.area_code

    url = "http://maps.met.police.uk/php/dataview.php?area=#{area_code}&ct=8"
    html = get_request(url)
    doc = Hpricot html
    borough = doc.at('ul.bread-crumb/li[3]/a/text()').to_s

    group = PoliceGroup.find_by_name(borough)
    
    # redirect_to :controller => 'police_group', :action => 'show', :id => group.id
    redirect_to group
  end
  
  private

  def get_request url
    url = URI.encode(url)
    RestClient.get(url)
  end

  def morph_request url
    response = get_request url
    json = response.to_s
    hash = eval(json.gsub("':","' => ").sub("'type'","'request_type'"))
    Morph.from_hash(hash)
  end

end
