array = gets.split(' ')
n = array[0].to_i #ダイエットの日数
s = array[1].to_i #ダイエット開始前の動物の体重
t = array[2].to_i #動物が超えてはいけない体重

alts = [] #n日分の各日の選択肢（配列in配列）
i = 0
arr = []
n.times do
  arr = gets.split(' ')
  alts << arr
end

i = 0
n.times do
  alts[i][0] = -1 * alts[i][0].to_i
  alts[i][1] = alts[i][1].to_i
  i += 1
end

# alts[*][0]=ダイエットする alts[*][1]=ダイエットしない

route = [] 
a = [0, 1]

route = a.repeated_permutation(n).to_a # 全パターン(2^n)を打ち込む ex)[[0, 0, 0, 0],[0, 0, 0, 1],[0, 0, 1, 0]...]
ptnNum = route.length
ptn = 0 # 総パターン数
x = 0


ptnNum.times do
  sum = s
  j = 0 # ○日目
  n.times do
    sum += alts[j][route[x][j].to_i]
    j += 1
    if sum > t
      break
    end
  end
  if sum > 0 && sum <= t
    ptn += 1
  end
  x += 1
end

puts ptn