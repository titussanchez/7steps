require 'sinatra/base'
require 'sinatra/assetpack'
require 'less'
require 'group_collection'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.expand_path(File.join(root, "app/views")) }
  set :environment, ENV['RACK_ENV'].to_sym
  Less.paths << File.join(File.dirname(__FILE__), '/app/css')
  Less.paths << File.join(File.dirname(__FILE__), '/app/css/vendor/bootstrap3')
  puts Less.paths

  register Sinatra::AssetPack
  assets do
    serve '/js',     :from => 'app/js'
    serve '/css',    :from => 'app/css'
    serve '/images', :from => 'app/images'

    js :app, '/js/app.js', [
      '/js/vendor/bootstrap3/bootstrap.js'
    ]

    css :application, [
      '/css/vendor/bootstrap3/bootstrap.css',
      '/css/application.css'
    ]

    cache_dynamic_assets true

    js_compression  :uglify
    css_compression :simple
  end

  get '/' do
    @groups = GroupCollection.new
    haml :index
  end
end
