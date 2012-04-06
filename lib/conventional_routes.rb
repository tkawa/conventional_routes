require "conventional_routes/version"

module ActionDispatch::Routing
  class Mapper
    def conventional_routes
      Dir.glob('app/controllers/**/*_controller.rb').each do |path|
        controller = path.slice(%r|^app/controllers/(.*)_controller\.rb$|, 1)
        namespaces = controller.split('/')
        resources_name = namespaces.pop
        route = -> { resources resources_name }
        until namespaces.empty?
          ->(namespace_name, route_inside) {
            route = -> { namespace namespace_name, &route_inside }
          }.call(namespaces.pop, route)
        end
        route.call
      end
    end
  end
end

module ConventionalRoutes
  class Railtie < ::Rails::Railtie
    initializer 'conventional_routes' do |app|
      app.routes.append do
        conventional_routes
      end
    end
  end
end
