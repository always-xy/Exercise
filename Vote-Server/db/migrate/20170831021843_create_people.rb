class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
    	t.string :people_num,:null=>true,:limit=>100,:collate=>"utf8_bin",:default=>"",:comment=>"人员编号"	#人员编号
    	t.string :people_name,:null=>true,:limit=>100,:collate=>"utf8_bin",:default=>"",:comment=>"人员姓名"	#人员姓名
    	t.string :people_mobile,:null=>true,:limit=>100,:collate=>"utf8_bin",:default=>"",:comment=>"人员电话"	#人员电话
    	t.integer :vote_num,:null=>true,:default=>0,:comment=>"投票数量"	#投票数量
    	t.string :note,:null=>true,:limit=>100,:collate=>"utf8_bin",:default=>"",:comment=>"备注"	#备注
      t.string :approve_flag,:null=>true,:limit=>100,:collate=>"utf8_bin",:default=>"",:comment=>"审核" #审核
    	t.attachment :pic_url

    	t.string :status_code, :limit => 30, :default => "ENABLED"
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
    change_column :people,:id,:integer,:null=>false,:options=>"auto_increment"
    execute("alter table people change id id int(11) not null auto_increment")
  end
end
