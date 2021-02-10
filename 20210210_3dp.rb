str = gets
array = str.split(' ')
x = array[0].to_i
y = array[1].to_i
z = array[2].to_i

box =[] #立体分
z.times do
  row = [] #1面分
  x.times do
    row << gets
  end
  gets #罫線用
  box << row
end

r_box = box.reverse


k = 0
z.times do
  j = 0
  y.times do
    sum = 0
    i = 0
    x.times do
      if r_box[k][i].slice(j) == "#"
        sum += 1
      end
      i += 1
    end
    if sum >= 1
      print "#"
    else
      print "."
    end
    j += 1
  end
  puts ""
  k += 1
end