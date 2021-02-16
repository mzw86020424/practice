### 未完成 ###

require 'time'

array = gets.split.map(&:to_i)
a = array[0]
b = array[1]
c = array[2]
d = array[3]
e = array[4]

# ・上りの電車が駅に到着する a 秒前に踏切を閉じ、駅を出発した b 秒後に踏切を開きます。
# ・下りの電車が駅に到着する c 秒前に踏切を閉じ、駅に到着した d 秒後に踏切を開きます。
# ・踏切が閉まっている状態においてさらに踏切を閉じる必要が生じた場合、踏切を開く時刻がより遅いほうに従って踏切を開きます。
# ・踏切を開く時刻から e 秒以内に再度踏切を閉じる必要がある場合、踏切を開きません。

n = gets.to_i # 駅に出入りする電車の本数

info = []
n.times do
  array = gets.split(' ')
  info << {"f" => array[0], "t" => array[1], "s" => array[2],}
  info[0]["f"] = info[0]["f"].to_i
  # info[0]["t"] = Time.parse(info[0]["t"])
  # info[0]["s"] = Time.parse(info[0]["s"])
end

p info[0]