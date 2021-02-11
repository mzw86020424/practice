array = gets.split.map(&:to_i)
h = array[0] # 表の行数を表す整数 ex)5
w = array[1] # 列数を表す整数 ex)5

first = gets.split.map(&:to_i) # 0行目の最初の２つの数字 ex) [1, 2]
f_interval = first[1] - first[0]
second = gets.split.map(&:to_i) # 1行目の最初の２つの数字 ex) [3, 4]
s_interval = second[1] - second[0]

i = 1
(w - 2).times do # 1,2行目をオートフィル
  f_int = first[i] + f_interval
  first << f_int
  s_int = second[i] + s_interval
  second << s_int
  i += 1
end

a_interval = second[0] - first[0] # 0列目の0行目と1行目の差 -3
b_interval = (second[1] - first[1]) - a_interval #n列とn+1列のインターバルの差 -1

first.each do |f|
  print "#{f} "
end
puts ""
second.each do |f|
  print "#{f} "
end
puts ""

y = 1
(h - 2).times do
  x = 0
  w.times do
    print "#{second[0] + (a_interval * y) + (s_interval + (b_interval * y)) * x} "
    x += 1
  end
  puts ""
  y += 1
end
puts ""