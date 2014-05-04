require 'sinatra/base'
require 'sinatra/assetpack'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.expand_path(File.join(root, "app/views")) }
  set :environment, ENV['RACK_ENV'].to_sym

  register Sinatra::AssetPack
  assets do
    serve '/js',     :from => 'app/js'
    serve '/css',    :from => 'app/css'
    serve '/images', :from => 'app/images'

    css :application, ['/css/application.css']

    cache_dynamic_assets true

    js_compression  :uglify
    css_compression :simple
  end

  get '/' do
    haml :index
  end
end
