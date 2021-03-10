require './config/environment'

use Rack::MethodOverride
use ReviewsController
use BooksController
use UsersController
use Sessions_Controller
run ApplicationController
