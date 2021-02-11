array = gets.split.map(&:to_i) # ex)4 4
h = array[0] #地図の縦幅を表す整数
w = array[1] #地図の横幅を表す整数

area = [] # [[".", ".", "#", "."], [".", ".", "#", "."], ["#", "#", "#", "."], [".", ".", "#", "."]]
h.times do
  area << gets.split(/\s*/)
end

rope = 0
j = 0
h.times do
  i = 0
  w.times do
    if area[j][i] == "#"
      if j == 0 || area[j - 1][i] == "."
        rope += 1
      end
      if i == w - 1 || area[j][i + 1] == "."
        rope += 1
      end
      if j == h - 1 || area[j + 1][i] == "."
        rope += 1
      end
      if i == 0 || area[j][i - 1] == "."
        rope += 1
      end
    end
    i += 1
  end
  j += 1
end

puts rope