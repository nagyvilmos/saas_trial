class Users::RegistrationsController < Devise::RegistrationsController
   
   def create
        super do |resource| 
            if params[:plan]
                resource.plan_id = params[:plan]
            else
                # defaults to basic
                resource.plan_id = 1
            end
            if resource.plan_id == Plan.pro_plan.id
                resource.save_with_payment
            else
                resource.save
            end
        end
   end
end