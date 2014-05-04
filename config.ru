use Rack::Deflater

$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), 'app', 'models'))
require File.expand_path '../app.rb', __FILE__

run App
