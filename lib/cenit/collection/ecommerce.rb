module Cenit
  module Collection
    require File.expand_path(File.join(*%w[ ecommerce build ]), File.dirname(__FILE__))
    require "cenit/client"

    @ecommerce = Cenit::Collection::Ecommerce::Build.new

    # Include Collection Gem dependency
    # require "cenit/collection/[My Dependency Collection]/build"
    # Collection dependency
    # @ecommerce.register_dep(Cenit::Collection::[My Dependency Collection]::Build.new)

    def self.push_collection (config)
      Cenit::Client.push(@ecommerce.shared_collection.to_json, config)
    end

    def self.show_collection
      @ecommerce.shared_collection
    end

    def self.pull_collection (parameters,config)
      @ecommerce.shared_collection
    end

    def self.push_sample(model, config)
      Cenit::Client.push(@ecommerce.sample_model(model).to_json, config)
    end

    def self.import(data)
      @ecommerce.import_data(data)
    end
  end
end