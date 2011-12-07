module SsoClient
  class HomeController < ApplicationController
    before_filter :login_required

    def show
    end
  end
end
