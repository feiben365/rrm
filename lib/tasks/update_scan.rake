namespace :dev do
  task update_scan: :environment do
    puts "Scan数据表里共有#{Scan.count}个数据"
      response = RestClient.get "http://www.rrdnyyy.com/admin/refs/json"
      data = JSON.parse(response.body)
      if response.code == 200
        data.each do |c|
          existing_scan = Scan.find_by_scan( c["id"] )
          if existing_scan.blank?
            scan_at = Time.at(c["scan_at"].to_i).to_datetime
            puts "#{scan_at}"
            Scan.create!(scan: c["id"], user_openid: c["user_openid"], user_id: c["user_id"], category: c["category"], parent_id: c["parent_id"], scan_at_u: c["scan_at"], scan_at: scan_at)
          end
        end
      end
      puts "Scan数据表里共有#{Scan.count}个数据"
  end
end
