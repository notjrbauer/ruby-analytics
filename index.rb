#!ruby -I ../lib -I lib
#
require 'segment/analytics'
require 'nyny'
require 'json'

Analytics = Segment::Analytics.new({
  write_key: 'i6aoC3CdUjS4BvSOvmJQguLBAlvzt6kG',
  on_error: Proc.new { |status, msg| print msg }
})

class App < NYNY::App
  before { headers['Content-Type'] = 'application/json' }

  helpers do
    def json data
      data.to_json
    end
  end

  post '/identify' do
    begin
      @result = JSON.parse(request.body.read)
      @hash = HashWithIndifferentAccess.new(@result)
      Analytics.identify(@hash)
    rescue Exception=>e
      "\tCaught: #{e}"
    end
  end

  post '/track' do
    begin
      @result = JSON.parse(request.body.read)
      @hash = HashWithIndifferentAccess.new(@result)
      Analytics.track(@hash)
    rescue Exception=>e
      "\tCaught: #{e}"
    end
  end
  post '/group' do
    begin
      @result = JSON.parse(request.body.read)
      @hash = HashWithIndifferentAccess.new(@result)
      Analytics.group(@hash)
    rescue Exception=>e
      "\tCaught: #{e}"
    end
  end
  post '/page' do
    begin
      @result = JSON.parse(request.body.read)
      @hash = HashWithIndifferentAccess.new(@result)
      Analytics.page(@hash)
    rescue Exception=>e
      "\tCaught: #{e}"
    end
  end
  post '/screen' do
    begin
      @result = JSON.parse(request.body.read)
      @hash = HashWithIndifferentAccess.new(@result)
      result = Analytics.screen(@hash)
    rescue Exception=>e
      "\tCaught: #{e}"
    end
  end
  post '/alias' do
    begin
      @result = JSON.parse(request.body.read)
      @hash = HashWithIndifferentAccess.new(@result)
      Analytics.alias(@hash)
    rescue Exception=>e
      "\tCaught: #{e}"
    end
  end
end

App.run! ENV["PORT"]
