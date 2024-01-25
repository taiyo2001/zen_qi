class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  layout :layout_by_resource

  protected

  def layout_by_resource
    # TODO: 共通処理になってしまうのでdevise_controllerでオーバーライトさせたい
    if devise_controller?
      'authentication'
    else
      'application'
    end
  end
end
