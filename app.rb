require 'sinatra/base'
require 'sinatra/assetpack'
require 'less'
require 'group'
require 'group_collection'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.expand_path(File.join(root, "app/views")) }
  set :environment, ENV['RACK_ENV'].to_sym
  Less.paths << File.join(File.dirname(__FILE__), '/app/css')
  Less.paths << File.join(File.dirname(__FILE__), '/app/css/vendor/bootstrap3')

  register Sinatra::AssetPack
  assets do
    serve '/js',     :from => 'app/js'
    serve '/css',    :from => 'app/css'
    serve '/images', :from => 'app/images'

    js :app, '/js/app.js', ['/js/application.js']

    css :application, [
      '/css/vendor/bootstrap3/bootstrap.css',
      '/css/application.css'
    ]

    cache_dynamic_assets true

    js_compression  :uglify
    css_compression :simple
  end

  #----------------------------------------------------------------------------#
  # Routes                                                                     #
  #----------------------------------------------------------------------------#
  get '/' do
    @groups = GroupCollection.new
    3.times do
      @groups << Group.new(:name => "Jordan's Group", :address => "555 East St.", :city => "Portage", :state => "MI", :zip => "49024", :email => "jordan@solidlives.com", :phone => "269-555-1212", :meeting_wday => Date.today.wday)
    end
    haml :index
  end
end
