module Worker
    module Incident
      class LegacyOrganizationsController < ApplicationController
        include ApplicationHelper
        before_filter :check_incident_permissions
      

        def index
            # search legacy_organization_event for legacy_organization_id: current_user_event
            # pass those ids to LegacyOrg.find(ids)
        	@orgs = Legacy::LegacyOrganization.order("name").paginate(:page => params[:page])
        	@event_id = params[:id]
        end
  
        def show
        	@organization = Legacy::LegacyOrganization.find(params[:org_id])
        	@event_id = params[:id]
        end
      end
    end
end