require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use MealController
use RestaurantController
run ApplicationController
#need to add other controllers in here but with Use, not Run

