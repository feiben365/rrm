namespace :dev do
  task update_scan: :enviroment do
    puts "Scan数据表里共有#{Scan.count}个数据"
      response = RestClient.get "http://www.rrdnyyy.com/admin/refs/json"
      data = JSON.parse(response.body)
      if response.code == 200
        data.each do |c|
          if existing_scan.blank?
            scan_at = Time.at(c["scan_at"].to_i).to_datetime
            Scan.create( scan_at: scan_at)
          end
        end
      end
      puts "Scan数据表里共有#{Scan.count}个数据"
  end
end
