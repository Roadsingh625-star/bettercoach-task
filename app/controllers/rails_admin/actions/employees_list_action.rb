module RailsAdmin
  module Actions
    class EmployeesListAction < RailsAdmin::Config::Actions::Base
      RailsAdmin::Config::Actions.register(self)

      register_instance_option :collection? do
        false
      end

      register_instance_option :member? do
        true
      end

      register_instance_option :http_methods do
        [:get]
      end

      register_instance_option :controller do
        proc do
          @company = Company.find(params[:id])
          @employees = @company.employees.page(params[:page]).per(10)
          render @action.template_name
        end
      end

      register_instance_option :link_icon do
        'icon-users'
      end

      register_instance_option :pjax? do
        false
      end
    end
  end
end
