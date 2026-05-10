# frozen_string_literal: true

require "rails/generators/active_record/model/model_generator"
require "yaml"

ActiveRecord::Generators::ModelGenerator.class_eval do
  def update_locale
    path = Rails.root.join("config/locales/models/en.yml")
    FileUtils.mkdir_p(path.dirname)

    data = path.exist? ? (YAML.load_file(path) || {}) : {}
    locale_deep_merge!(data, locale_translations)
    path.write(data.to_yaml)

    say_status :update, "config/locales/models/en.yml", :green
  end

  private

  def locale_translations
    attrs = attributes.reject(&:reference?).each_with_object({}) do |attr, h|
      h[attr.name] = attr.name.humanize
    end

    { "en" => { "activerecord" => {
      "models"     => { file_name => class_name.humanize },
      "attributes" => { file_name => attrs }
    } } }
  end

  def locale_deep_merge!(base, overlay)
    overlay.each do |k, v|
      base[k] = base[k].is_a?(Hash) && v.is_a?(Hash) ? locale_deep_merge!(base[k], v) : v
    end
    base
  end
end
