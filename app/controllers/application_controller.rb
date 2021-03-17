class ApplicationController < ActionController::Base
    
    def index
        @tasks = Task.all
    end
end
