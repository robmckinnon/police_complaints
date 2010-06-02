class PoliceGroupsController < ResourceController::Base

  before_filter :ensure_current_url, :only => :show

  private
    def ensure_current_url
      begin
        group = PoliceGroup.find(params[:id])
        redirect_to(group, :status => :moved_permanently) if group.has_better_id?
      rescue
        render_not_found
      end
    end
end
