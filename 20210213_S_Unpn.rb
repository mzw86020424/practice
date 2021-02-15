### 未完成 ###

n = gets.to_i # 商品の数 3

items = [] # 各商品の重さ [1, 1, 3]
i = 0
n.times do
  items << gets.to_i
  i += 1
end
items = items.sort.reverse

m = gets.to_i # 運搬方法の種類を表す整数 2

ways = [] # 重さの上限とコスト [[1, 1], [4, 3]]
j = 0
way = {}
m.times do
  arr = gets.split.map(&:to_i)
  way[:limit] = arr[0]
  way[:cost] = arr[1]
  way[:cospa] = arr[1]/arr[0].to_f
  ways[j] = way
  j += 1
  way = {}
end
ways.sort_by! { |a| a[:cospa] }

count = n
ptns = [] # 一つの配送方法に対して考えられる荷物の組み合わせ [[3, 1, 1], [3, 1], [1, 1], [3], [1]]
n.times do
  ptns.concat(items.combination(count).to_a).uniq!
  count -= 1
end

capa = 0
ptns.length.times do
  if ways[0][:limit] - ptns[0].sum >= 0
    capa = ways[0][:limit] - ptns[0].sum
    
  end
end