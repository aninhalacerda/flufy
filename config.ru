# config.ru
require "./app"
run Rack::URLMap.new({
  "/" => App::Public,
  "/protected" => App::Protected
})