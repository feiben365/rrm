namespace :dev do
  task :fetch_scan => environment do
    puts "Fetch scan data..."
      response = RestClient.get "http://www.rrdnyyy.com/admin/refs/json"
      data = JSON.parse(response.body)

  end
end
