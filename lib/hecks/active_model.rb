require 'hecks-app'

module Hecks
  module ActiveModel
    def self.decorate
      HecksApp::DOMAIN_SCHEMA.aggregates.each do |aggregate_from_schema|
        HecksApp::ApplicationPort
          .domain::Domain
          .const_get(aggregate_from_schema.name).tap do |aggregate|
            aggregate.constants.each do |domain_model_name|
              aggregate.const_get(domain_model_name).tap do |domain_model|
                domain_model.include(::ActiveModel::Model)
                domain_model.define_singleton_method :model_name do
                  ::ActiveModel::Name.new(
                    self,
                    nil,
                    domain_model.name.to_s.split('::')[-2..-1].join('::')
                  )
                end
              end
            end
          end
      end
    end
  end
end
