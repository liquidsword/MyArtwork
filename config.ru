require './config/environment'

if ActiveRecord::Base.needs_migration?
raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use UsersController
use ArtworkController
run ApplicationController

