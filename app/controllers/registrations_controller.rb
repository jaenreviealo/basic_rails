class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super 
  end

  protected

    def auth_options
      { scope: resource_name, recall: 'registrations#new' }
    end
  end
  