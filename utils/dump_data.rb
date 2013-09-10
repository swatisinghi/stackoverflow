require 'mysql'
require 'rubygems'
require 'csv'

begin
  con = Mysql.new 'localhost', 'root', '', 'stackoverflow'
  ['android', 'c++', 'csharp', 'html', 'java', 'javascript', 'jquery', 'mysql', 'php', 'python'].each do |topic|
    csv = CSV.parse(File.read("./topic_data/#{topic}"), :headers => false)
    csv.each do |row|
      con.  query("INSERT INTO topic_data (topic, votes, answers, accepted_answers, views, hotViews, warmViews, title) VALUES
                        ('#{topic}', #{row[0]}, #{row[1]}, #{row[2]}, #{row[3]}, #{row[4]}, #{row[5]}, '#{row[6]}')")
    end
  end
end
