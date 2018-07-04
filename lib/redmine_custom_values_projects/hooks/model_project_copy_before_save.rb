module RedmineCustomValuesProjects
  module Hooks
    class ModelProjectCopyBeforeSave < Redmine::Hook::Listener
      def model_project_copy_before_save(context = {})
        source_project = context[:source_project]
        destination_project = context[:destination_project]
	custom_valuess = CustomFieldProjectValue.where(project_id: source_project.id)
	custom_valuess.each do |custom_values|
	  cvs = custom_values.dup
	  cvs.project = destination_project
	  cvs.save!
	end
      end
    end
  end
end