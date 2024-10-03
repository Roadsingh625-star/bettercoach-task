RailsAdmin.config do |config|
  config.model 'EmployeeCompanyProgram' do
    visible false
  end
  config.model 'CompanyProgram' do
    list do
      field :company do
        pretty_value do
          bindings[:object].company.name
        end
      end

      field :program do
        pretty_value do
          bindings[:object].program.name
        end
      end
    end

    edit do
      field :company do
        associated_collection_scope do
          Proc.new { |scope|
            scope.all
          }
        end

        associated_collection_cache_all false
        associated_collection_scope do
          Proc.new { |scope|
            scope.select(:id, :name)
          }
        end
        formatted_value do
          bindings[:object].company.try(:name)
        end
      end

      field :program do
        associated_collection_scope do
          Proc.new { |scope|
            scope.all
          }
        end

        associated_collection_cache_all false
        associated_collection_scope do
          Proc.new { |scope|
            scope.select(:id, :name)
          }
        end
        formatted_value do
          bindings[:object].program.try(:name)
        end
      end
    end

    show do
      field :company do
        pretty_value do
          bindings[:object].company.try(:name)
        end
      end

      field :program do
        pretty_value do
          bindings[:object].program.try(:name)
        end
      end

      field :employees do
        pretty_value do
          bindings[:object].employees.map(&:first_name).join(", ")
        end
      end

      field :coaches do
        pretty_value do
          bindings[:object].company_program_coaches.map { |c| c.coach.full_name }.join(", ")
        end
      end
    end
  end
end
