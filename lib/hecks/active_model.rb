require 'hecks-app'

module Hecks
  module ActiveModel
    def self.decorate
      HecksApp::DOMAIN_SCHEMA.aggregates.each do |aggregate|
        root_name = aggregate.instance_variable_get(:@root).name
        HecksApp::ApplicationPort
          .domain::Domain
          .const_get(aggregate.name)
          .const_get(root_name).tap do |root|
            root.include(::ActiveModel::Model)

            root.define_singleton_method :model_name do
              "#{aggregate.name}::#{root_name}"
            end
          end
      end
    end
  end
end
