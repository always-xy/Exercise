class PeopleController < ApplicationController

	def index_manage
		@person = Person.where(:approve_flag=>"false").first
	end

	def index_manage_approve
		person = Person.find_by_id(params[:id])
		if params[:flag] == "true"
			#审核通过
			person.update_attributes(:approve_flag=>"1")
		elsif params[:flag] == "false"
			#审核失败
			person.update_attributes(:approve_flag=>"0")
		end
		redirect_to({:action=>"index_manage"})
	end

	def index
	end

	def apply
		if params[:id].present?
			#临时创建
			@person = Person.find(params[:id])
			@person.people_name = "" if @person.people_name == "姓名"
			@person.people_mobile = "" if @person.people_mobile == "电话"
			@pic_url = "true"
		else
			#正常创建
			@person = Person.new
			@pic_url = "false"
		end
	end

	def apply_create
		params.permit!
		if params[:flag_id] =="temp_flag"
			#临时创建
			person = Person.new(params[:person])
			person.approve_flag = "temp_flag"
			person.save
			redirect_to({:action=>"apply",:id=>person.id})
		else
			#正常保存
			if params[:id].present?
				person = Person.find_by_id(params[:id])
				person.update_attributes(params[:person])
			else
				person = Person.new(params[:person])
			end
			person.approve_flag = "false"
			person.save
		end
	end

	def vote_index
		if params[:people_name_num].blank?
			@person = Person.where(:approve_flag=>"1").order("vote_num DESC")
		else
			@person = Person.where(:approve_flag=>"1").where("people_name like '%#{params[:people_name_num]}%' or id like '%#{params[:people_name_num]}%'").order("vote_num DESC")
		end
		@people_count = @person.count
	end

	def vote_index_search
		redirect_to({:action=>"vote_index",:people_name_num=>params[:people_name_num]})
	end

	def vote_index_detail
		@person = Person.find_by_id(params[:id])
	end

	def vote_index_detail_count
		person = Person.find_by_id(params[:id])
		person.vote_num += 1
		person.save
	end

	def active_rule
	end

end
