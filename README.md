# CustomerIO-coding-challenge

For the given challenge I imported the CSV data file  to rails using rake.

Environment:
 Ubuntu  - Ubuntu 16.4 
 Ruby - ruby 2.3.1
 Rails - Rails 5.0.1

Steps:

Created a new rails app with
 
	rails new importCSV

Folder Structure was created as,
|--app 
|--bin 
|--config     
|--db   
|--lib
|--log
|--public 
|--test 
|--tmp 
|--vendor
--.gitignore
--Gemfile
--Gemfile.lock
--README.md        
--Rakefile    
--config.ru                          


Files:

db/sample_data.csv - I downloaded the data file and placed in db folder as sample_data.csv. [Path: db/sample_data.csv]

lib/tasks/import.rake - I defined the rake task as import in lib/tasks folder.


TASK:
#Main Program

####lib/tasks/import.rake

require 'csv'

desc "Import Data from csv file"
task :import => [:environment] do

inputfile = "db/sample_data.csv"


##declaration

rows = []
result = ""

 #Reading the input file 
 CSV.foreach(inputfile, :headers => true) do |row|
   
   #Filtering rows with column "created_at"   between the date June 22 2014 to July 22 2014 23:59:59 hrs

   if row["created_at"].between?((Time.gm(2014,6,22,0,0,0).to_i).to_s,(Time.gm(2014,7,22,23,59,59).to_i).to_s
	
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


To Run the Program:

From the terminal, change to the app directory and run rake import or bundle exec rake import.
  
    bundle exec rake import

Attached the screenshot of the output.
