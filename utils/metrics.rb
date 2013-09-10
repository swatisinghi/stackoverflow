require 'mysql'
require 'rubygems'
require 'json'


begin
    con = Mysql.new 'localhost', 'root', '', 'stackoverflow'
    query = ARGV[0]
    file = ARGV[1]
    integer_values = ARGV[2].split(",")
    rs = con.query(query)   
    highest_voted_topic = []
    rs.each_hash do |row|
      integer_values.each {|val| row[val] = row[val].to_i}
      highest_voted_topic.push row
    end  
    begin
        file = File.open(file, 'w')
        file.write(highest_voted_topic.to_json)
    rescue IOError => e
        puts e
    ensure
        file.close unless file == nil
    end    
end