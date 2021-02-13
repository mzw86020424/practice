array = gets.split.map(&:to_i)
n = array[0] # 選択できるお菓子の種類 3
x = array[1] # 指定制限金額 300

sweets = [] # お菓子の金額 [150, 120, 130]
n.times do
  sweets << gets.to_i
end

ptns = []
i = n
maxLen = 0
minChng = x
n.times do
  ptn = sweets.combination(i).to_a
  j = 0
  ptn.length.times do
    if ptn[j].sum <= x && ptn[j].length >= maxLen
      ptns << ptn[j]
      maxLen = ptn[j].length
      if x - ptn[j].sum < minChng
        minChng = x - ptn[j].sum
      end
    end
    j += 1
  end
  i -= 1
end

p minChng