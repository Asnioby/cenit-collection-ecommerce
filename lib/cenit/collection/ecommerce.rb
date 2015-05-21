require "cenit/collection/ecommerce/version"

module Cenit
  module Collection
    require "cenit/collection/ecommerce/build"
    require "cenit/client"

    # bundle exec irb -I lib -r 'cenit/collection/ecommerce'
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :connection_token => "My Conn Token", :connection_key => "My Conn Key"}
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :user_token => "My User Token", :user_key => "My User Key"}
    # Cenit::Collection::Ecommerce.push_collection config
    # Cenit::Collection::Ecommerce.shared_collection

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
      Cenit::Client.push(@ecommerce.sample_data(model).to_json, config)
    end
  end
end