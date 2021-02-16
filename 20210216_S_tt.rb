### 未完成 ###

n = gets.to_i # 現代を含めたターゲットの時代の総数 ex) 5
costs = gets.split.map(&:to_i) # 未来に進むコストを表す整数 c_f および過去に戻るコストを表す整数 c_b ex) 5 10
stats = gets.split(//) # 出発時点でのターゲットの時代の状態 ex) ssdss
stats.pop
# [s, s, d, s, s]
ages = [] # 各時代のindexを入れた配列 ex)[0, 1, 2, 3, 4]
m = 0
stats.length.times do
  ages << m
  m += 1
end

routes = []
route = []


status = stats
def statusChange(current_age, n, stats, status)
  x = 0
  n.times do
    if x > current_age
      if stats[x] == "s"
        status[x] = "d"
      else
        status[x] = "s"
      end
    end
    x += 1
  end
end

current_age = ages.last
undone_ages = ages

j = 0
while j < n do
  
  i = 0
  while i < ages.last
    if undone_ages.empty? && current_age == ages.last 
      routes << route
      break
    elsif undone_ages.empty? && current_age != ages.last && status.last == "s"
      route << ages.last
      current_age = ages.last
    elsif ages[i + j] != current_age && status[i + j] == "s" && undone_ages.include?(ages[i + j])
      route << i + j
      current_age = i + j
      statusChange(current_age, n, stats, status)
      undone_ages.delete(i + j)
      i = 0
    else
      i += 1
    end
    
    if ages[i + j] != current_age && status[i + j] == "s"
      route << i + j
      current_age = i + j
      statusChange(current_age, n, stats, status)
      i = 0
      # puts "debug:#{route}"
      puts "debug:#{route.last[-1]}"
    else
      i += 1
    end

    if route.last == route.last[-1]
      
      break
    end
  end

  i = 0
  j += 1
  route = []
  undone_ages = ages
  status = stats  

end
  

p routes

# elsif ages[i] != current_age && status[i] == "s"
#       route << i
#   current_age = i
#   statsChange(current_age)

cost = 0