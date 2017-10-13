class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['SECRET_NAME'], password: ENV['SECRET_PASSWORD']
end