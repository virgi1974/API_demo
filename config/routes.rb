require 'api_constraints'
    
Rails.application.routes.draw do

  devise_for :users
  # namespace for the API

  # we need to tell Rails how
  # namespace :api, defaults: { format: :json }, constraints: {subdomain: 'api'}, path: '/'  do 
  namespace :api, defaults: { format: :json }, path: '/'  do 


    # Since we don’t want to affect our URI structure for the resource,
    #  we can use the :module scope to namespace the controller and not the URI.
      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        # to route requests for different versioned representations.
        # We can do this effectively by using a route constraint that checks for a version specified 
        # in the request’s accept header.
        resources :users, :only => [:show, :create, :update, :destroy]

    end

  end
end
