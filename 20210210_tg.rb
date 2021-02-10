c = gets.to_i #見出し（列）の個数
str = gets
hds = str.split(" ") #見出しの配列
r = gets.to_i #行の数

dts = [] #データの中身(配列in配列)
r.times do
  str = gets
  dt = str.split(" ")
  dts << dt #dts（配列）にdt（配列）を追加
end

maxData = [] #各列の最大長が入った配列
i = 0
while i < c
  maxCheck = []
  j = 0
  while j < r
    maxCheck << dts[j][i]
    j += 1
  end
  maxCheck << hds[i]
  max = 0
  maxCheck.each do |s|
    if max < s.length
      max = s.length
    end
  end
  maxData[i] = max
  i += 1
end

# 1行目（見出し）出力
x = 0
c.times do
  print "| #{hds[x]}"
  print  " " * (maxData[x] - hds[x].length + 1)
  x += 1
end
puts "|"

# 2行目（罫線）出力
y = 0
c.times do
  print "|"
  print  "-" * (maxData[y] + 2)
  y += 1
end
puts "|"

# 3行目〜（データ）出力
a = 0
r.times do
  z = 0
  c.times do
    print "| #{dts[a][z]}"
    print  " " * (maxData[z] - dts[a][z].length + 1)
    z += 1
  end
  puts "|"
  a += 1
end


