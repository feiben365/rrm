namespace :dev do
  task :fetch_scan => environment do
    puts "Fetch scan data..."
      response = RestClient.get "/json"
  end
