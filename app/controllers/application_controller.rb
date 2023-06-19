class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "Anas", password: "1234"
end
  