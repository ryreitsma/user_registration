require 'yaml'
require 'json'

class I18n < Thor
  desc 'build_json', 'Create the JSON files for client-side translations'
  def build_json
    Dir.glob('config/locales/*.yml').each do |source_yml|
      language = File.basename(source_yml, '.yml')

      json_content = YAML::load_file('config/locales/nl.yml').to_json
      json_filename = "public/locales/#{language}.json"

      File.write(json_filename, json_content)
    end
  end
end

