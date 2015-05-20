class ChartsController < ApplicationController
  def index
  end

  def get_data
#------------------Module1-----------------------------------------

  	#From json to hash - consumption_profile_generic 
  	 file_path = Rails.root.join('db','consumption_profile_generic_some_columns.js')  
     file_gen = File.read(file_path) 
     data_hash_gen = JSON.parse(file_gen)  

	#Passing variable introduced by the user in mod1
	#@user_entry_module1 = params[:user_entry_module1]

	# Filtering date and consumption_% ind 2 vectors and then merging them
	num = data_hash_gen.count 
	vectorA = Array.new
	vectorB = Array.new
	i = 0
	while num > i
		vectorA[i] = data_hash_gen[i]["consumption_%"].to_f 
		vectorB[i] = data_hash_gen[i]["date"]
		i += 1
	end
	#@vectorB = [1,2,3,4] 
	data = vectorA
	
    #puts @vectorC.class
    factor = params[:factor].to_i 
    data = data.map{|i| i * factor} 
  	render json: data

  end
end
