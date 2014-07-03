class ExtractUsers < Thor
  desc :to_textfile, "Extract users from the database and write them in a textfile"
  method_option :env, :default => "development"
  def to_textfile
    ENV['RAILS_ENV'] = options.env
    require File.expand_path('config/environment.rb')

    filename = "extracted_users_#{DateTime.now.strftime('%d-%m-%Y')}.txt"
    File.open(filename, 'w') do |f|
      User.order(:name).each do |user|
        f.write("#{user.name}\t\t#{user.email}\t\t#{user.created_at.strftime('%d-%m-%Y')}\n")
      end
    end
  end

  desc :to_csv, "Extract users from the database and write them in a CSV file"
  method_option :env, :default => "development"
  def to_csv
    ENV['RAILS_ENV'] = options.env
    require File.expand_path('config/environment.rb')

    filename = "extracted_users_#{DateTime.now.strftime('%d-%m-%Y')}.csv"
    CSV.open(filename, "wb") do |csv|
      User.order(:name).each do |user|
        csv << [user.name, user.email, user.created_at.strftime('%d-%m-%Y')]
      end
    end
  end
end