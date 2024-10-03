RailsAdmin.config do |config|
  config.model 'CompanyProgramCoach' do
    list do
      field :company_program do
        pretty_value do
          "#{bindings[:object].company_program.program.name} (#{bindings[:object].company_program.company.name})"
        end
      end

      field :coach do
        pretty_value do
          "#{bindings[:object].coach.first_name} #{bindings[:object].coach.last_name}"
        end
      end

      field :start_time do
        label "Start Time"
      end

      field :end_time do
        label "End Time"
      end

      field :created_at
      field :updated_at
    end

    edit do
      field :company_program do
        associated_collection_scope do
          Proc.new { |scope| scope.includes(:company, :program).all }
        end
        formatted_value do
          "#{bindings[:object].company_program.program.name} (#{bindings[:object].company_program.company.name})"
        end
      end

      field :coach do
        associated_collection_scope do
          Proc.new { |scope| scope.all }
        end
        formatted_value do
          "#{bindings[:object].coach.first_name} #{bindings[:object].coach.last_name}"
        end
      end

      field :start_time do
        label "Start Time" 
      end

      field :end_time do
        label "End Time"
      end
    end

    show do
      field :company_program do
        pretty_value do
          "#{bindings[:object].company_program.program.name} (#{bindings[:object].company_program.company.name})"
        end
      end

      field :coach do
        pretty_value do
          "#{bindings[:object].coach.first_name} #{bindings[:object].coach.last_name}"
        end
      end

      field :start_time do
        label "Start Time"
      end

      field :end_time do
        label "End Time"
      end

      field :created_at
      field :updated_at
    end
  end
end
