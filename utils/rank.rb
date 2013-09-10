require 'mysql'
require 'rubygems'
require 'json'

begin
  file = ARGV[0]
  con = Mysql.new 'localhost', 'root', '', 'stackoverflow'
  rank = 0
  rank_hash = {'android' => {"votes" => 0, "views" => 0, "ans" => 0},
               'c++' => {"votes" => 0, "views" => 0, "ans" => 0},
               'csharp' => {"votes" => 0, "views" => 0, "ans" => 0},
               'html' => {"votes" => 0, "views" => 0, "ans" => 0},
               'java' => {"votes" => 0, "views" => 0, "ans" => 0},
               'javascript' => {"votes" => 0, "views" => 0, "ans" => 0},
               'jquery' => {"votes" => 0, "views" => 0, "ans" => 0},
               'mysql' => {"votes" => 0, "views" => 0, "ans" => 0},
               'php' => {"votes" => 0, "views" => 0, "ans" => 0},
               'python' => {"votes" => 0, "views" => 0, "ans" => 0}}

  rs = con.query("select topic as label, sum(views + hotViews + warmViews) as value from topic_data group by topic order by value desc")
  rs.each_hash do |row|
    rank += 1
    rank_hash[row['label']]["views"] = rank
  end

  rank = 0
  rs = con.query("select topic as label, sum(votes) as value from topic_data group by topic order by value desc")
  rs.each_hash do |row|
    rank += 1
    rank_hash[row['label']]["votes"] = rank
  end

  rank = 0
  rs = con.query("select topic as label, sum(answers + accepted_answers) as value from topic_data group by topic order by value desc")
  rs.each_hash do |row|
    rank += 1
    rank_hash[row['label']]['ans'] = rank
  end


  total = {}
  ['android', 'c++', 'csharp', 'html', 'java', 'javascript', 'jquery', 'mysql', 'php', 'python'].each {|topic| total[topic] = rank_hash[topic]['votes'] + rank_hash[topic]['views'] + rank_hash[topic]['ans']}

  total = total.sort_by &:last

  sorted = []
  total.each {|tot| sorted.push(tot[0])}

  begin
    file = File.open(file, 'w')
    file.write(sorted)
  rescue IOError => e
    puts e
  ensure
    file.close unless file == nil
  end

end