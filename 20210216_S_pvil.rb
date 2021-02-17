array = gets.split.map(&:to_i)
n = array[0] # 村人の人数 3
m = array[1] # 友好関係の数 2
q = array[2] # ログが更新される回数 3

rel = [] # 村人 a_i と村人 b_i の友好度は f_i  [[2, 5, 9], [2, 4, 0], [1, 5, 6], [1, 4, 6]]
m.times do
  rel << gets.split.map(&:to_i)
end

in_out = [] # 入退会、村人No [["+", 1], ["-", 1], ["+", 1], ["+", 5]]
q.times do
  arr = gets.split(' ')
  arr2 = []
  arr2 << arr[0]
  arr2 << arr[1].to_i
  in_out << arr2
end

favs = [] # 好感度
max_fav = 0
member = [] # 同好会メンバー

j = 0
q.times do
  max_fav = 0
  i = 0
  if in_out[j][0] == "+" # +のとき
    member << in_out[j][1]
    m.times do
      if member.include?(rel[i][0]) && !member.include?(rel[i][1]) || member.include?(rel[i][1]) && !member.include?(rel[i][0])
        if rel[i][2] > max_fav
        max_fav = rel[i][2]
        end
      end
      i += 1
    end
    favs << max_fav
  else
    member.delete(in_out[j][1])
    m.times do
      if member.include?(rel[i][0]) && !member.include?(rel[i][1]) ||
         member.include?(rel[i][1]) && !member.include?(rel[i][0]) &&
         rel[i][2] > max_fav
        max_fav = rel[i][2]
      end
      i += 1
    end
    favs << max_fav
  end
  j += 1
end

favs.each do |f|
  puts f
end