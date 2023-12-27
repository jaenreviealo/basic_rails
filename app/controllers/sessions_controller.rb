class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super 
  end

  protected

    def auth_options
      { scope: resource_name, recall: 'sessions#new' }
    end
end
  