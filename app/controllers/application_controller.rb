class ApplicationController < ActionController::Base
  def hello
    render html: 'Hellooo'
  end
end
