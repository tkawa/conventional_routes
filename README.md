# Conventional Routes

Conventional (CoC) routes provider for Rails 3.

This enables conventional resource routes without a definition in `config/routes.rb`.


## Features

This gem generates resource routes from existing controller files.

All routes are `resources`. A controller in a directory produces a `namespace`.

### Example

When these files exist:

    app/controllers/admin/special/licenses_controller.rb
    app/controllers/admin/users_controller.rb
    app/controllers/users_controller.rb

same as following definition:

    namespace :admin do
      namespace :special do
        resources :licenses
      end
      resources :users
    end
    resources :users

generates following routes:

        admin_special_licenses GET    /admin/special/licenses(.:format)          admin/special/licenses#index
                               POST   /admin/special/licenses(.:format)          admin/special/licenses#create
     new_admin_special_license GET    /admin/special/licenses/new(.:format)      admin/special/licenses#new
    edit_admin_special_license GET    /admin/special/licenses/:id/edit(.:format) admin/special/licenses#edit
         admin_special_license GET    /admin/special/licenses/:id(.:format)      admin/special/licenses#show
                               PUT    /admin/special/licenses/:id(.:format)      admin/special/licenses#update
                               DELETE /admin/special/licenses/:id(.:format)      admin/special/licenses#destroy
                   admin_users GET    /admin/users(.:format)                     admin/users#index
                               POST   /admin/users(.:format)                     admin/users#create
                new_admin_user GET    /admin/users/new(.:format)                 admin/users#new
               edit_admin_user GET    /admin/users/:id/edit(.:format)            admin/users#edit
                    admin_user GET    /admin/users/:id(.:format)                 admin/users#show
                               PUT    /admin/users/:id(.:format)                 admin/users#update
                               DELETE /admin/users/:id(.:format)                 admin/users#destroy
                         users GET    /users(.:format)                           users#index
                               POST   /users(.:format)                           users#create
                      new_user GET    /users/new(.:format)                       users#new
                     edit_user GET    /users/:id/edit(.:format)                  users#edit
                          user GET    /users/:id(.:format)                       users#show
                               PUT    /users/:id(.:format)                       users#update
                               DELETE /users/:id(.:format)                       users#destroy


## Usage

Add this to Gemfile and run `bundle`.
That's it.

    gem 'conventional_routes', :git => 'git://github.com/tkawa/conventional_routes.git'


## Copyright

Copyright (c) 2012 Toru KAWAMURA.

This project rocks and uses MIT-LICENSE.
