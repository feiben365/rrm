class CreateScans < ActiveRecord::Migration[5.0]
  def change
    create_table :scans do |t|
      t.string :scan #自定义的扫描事件编号
      t.string :user_openid #系统定义的一个用户编号，无实际意义
      t.string :user_id #系统定义的另一个用户编号，会在其他项目里被调用到
      t.string :category #每个持有人拥有编码的具体编号
      t.string :parent_id #编码持有人编号
      t.string :scan_at_u #自己试图定义的扫描时间字符串变量
      t.datetime :scan_at #自己试图定义的扫描时间时间变量
      t.timestamps
    end

    add_index :scans, :scan
  end
end
