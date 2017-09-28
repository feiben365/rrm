namespace :dev do
  task :fetch_scan => :environment do
    puts "Fetch scan data..."
      response = RestClient.get "http://www.rrdnyyy.com/admin/refs/json"
      data = JSON.parse(response.body)

      data.each do |c|
        existing_scan = Scan.find_by_scan( c["id"] )
        if existing_scan.nil?
          Scan.create!( :scan => c["id"], :user_openid => c["user_openid"],
                  :user_id => c["user_id"], :category => c["category"],
                  :parent_id => c["parent_id"], :scan_at => c["scan_at"],
                  :comfirmed_at => c["comfirmed_at"])
  end
end

puts "Total: #{Scan.count} scans"

  end
end
