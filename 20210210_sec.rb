array = gets.split.map(&:to_i)
w = array[0] # 美術館の床の横幅
h = array[1] # 美術館の床の縦幅
m = array[2] # カメラの台数
n = array[3] # 美術品の設置位置数

# 監視カメラの位置とカバーできる範囲

# x カメラのx座標
# y カメラのy座標
# t カメラの向き角度(美術館の右方向となす角)
# d 視野角
# r 見ることのできる距離の上限
cam = [] # [[x, y, t, d, r],[x, y, t, d, r]....]
cam_i = 0
m.times do
  cam << gets.split.map(&:to_i)
  cam_i += 1
end

# 美術品を置く位置

# a 美術品のx座標
# b 美術品のy座標
art = [] # [[a, b],[a, b]...]
art_i = 0
n.times do
  art << gets.split.map(&:to_i)
  art_i += 1
end 

n = 0
art.length.times do
  m = 0
  no = 0
  cam.length.times do
    distance = Math.sqrt((art[n][0] - cam[m][0])**2 + (art[n][1] - cam[m][1])**2)
    if distance > cam[m][4]
      no += 1
      m += 1
      p distance
      next
    end
    dig = Math.atan2(art[n][1] - cam[m][1], art[n][0] - cam[m][0])/Math::PI*360
    if dig <= cam[m][2] + cam[m][3]/2 && dig >= cam[m][2] - cam[m][3]/2
      puts "yes"
      break
    else
      no += 1
      m += 1
      if no >= cam.length
        puts "no"
      end
    end
  end
  n += 1
end