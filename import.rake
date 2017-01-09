require 'csv'

desc "Import Data from csv file"
task :import => [:environment] do

inputfile = "db/sample_data.csv"


#Declaration

rows = []
result = ""

 #Reading the input file 
 CSV.foreach(inputfile, :headers => true) do |row|
   
   #Filtering rows with column "created_at"   between the date June 22 2014 to July 22 2014 23:59:59 hrs

   if row["created_at"].between?((Time.gm(2014,6,22,0,0,0).to_i).to_s,(Time.gm(2014,7,22,23,59,59).to_i).to_s)
	
	rows << row.to_h  
   end
 end
 
  # Sorting filtered rows which is array of hash values with key: created_at 
  # getting the value of key:word and concatenating to the result

  sorted = rows.sort_by{ |row| row["created_at"] }
  sorted.each do |line|
	result += line["word"] + " "
  end  
   
  #Printing Result	
  p result

end





