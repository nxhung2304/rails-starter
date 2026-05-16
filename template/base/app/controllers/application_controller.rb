class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!, unless: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

    def record_not_found
      redirect_back_or_to root_path, alert: t("errors.not_found", default: "Record not found")
    end
end
