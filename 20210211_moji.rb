### 未完成 ###

n = gets.to_i #盤面の大きさを表す整数

board = [] #盤面の中身 ex)[[a, b, c],[c, a, b],[b, c, a]]
n.times do
  board << gets.split(/\s*/)
end

m = gets.to_i #作成可否を判定するべき文字列の数

strings = [] #作成可否を判定するべき文字列 ex)[[a, c, a],[b, c, a],[b, c, c]]
m.times do
  strings << gets.split(/\s*/)
end

# ボード
x = 0
y = 0
# 文字
a = 0 # a個目の配列
ban = null

baseX = 0
baseY = 0

b.length.times do
  b = 0 # b文字目

  if board[baseX][baseY] == strings[a][b]
    if board[x - 1][y] == strings[a][b + 1] && ban != 2
      x -= 1
      ban = 0
    elsif board[x][y + 1] == strings[a][b + 1]  && ban != 3
      y += 1
      ban = 1
    elsif board[x + 1][y] == strings[a][b + 1]  && ban != 0
      x += 1
      ban = 2
    elsif board[x][y - 1] == strings[a][b + 1]  && ban != 1
      y -= 1
      ban = 3
    end
    b += 1
    if b = strings[a].length
      puts "yes"
    end
  else
    puts "no"
  end
  ban = null
  baseX += 1
end