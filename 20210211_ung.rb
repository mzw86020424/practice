### 未完成 ###

array = gets.split.map(&:to_i)

d = array[0] #ブロックの長さ2d+1の d
n = array[1] #うなぎを操作する回数 n
ctrl = [] #n回目の操作 a_nの配列

n.times do
  ctrl << gets.to_i
end

position = 0
i = 0
n.times do
  if position + ctrl[i] <= d
    position += ctrl[i]
    print "R"
  else
    position -= ctrl[i]
    print "L"
  end
  i += 1
end
puts ""