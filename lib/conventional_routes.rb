require "conventional_routes/version"

module ActionDispatch::Routing
  class Mapper
    def conventional_routes
      Dir.glob('app/controllers/**/*_controller.rb').each do |path|
        controller = path.slice(%r|^app/controllers/(.*)_controller\.rb$|, 1)
        next if controller == 'application'
        namespaces = controller.split('/')
        resources_name = namespaces.pop
        route = -> { resources resources_name, :only => actions(path) }
        until namespaces.empty?
          ->(namespace_name, route_inside) {
            route = -> { namespace namespace_name, &route_inside }
          }.call(namespaces.pop, route)
        end
        route.call
      end
    end

    private
    def actions(path)
      restful_actions = [:index, :show, :new, :edit, :create, :update, :destroy]
      klass = Kernel.const_get(path.match(/app\/controllers\/(.*)\.rb/)[1].classify)
      klass.public_instance_methods(false) & restful_actions
    end
  end
end

module ConventionalRoutes
  class Railtie < ::Rails::Railtie
    initializer 'conventional_routes' do |app|
      app.routes.prepend do
        conventional_routes
      end
    end
  end
end
