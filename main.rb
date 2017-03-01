=begin
  Đếm một số N có bao nhiêu chữ só chẵn và bao nhiêu chữ số lẻ
  Ví dụ:
  Input: 123
  Output: Có 1 số chẵn. Có 2 số lẻ.
=end

def dem_chu_so n
  dem_chan = 0
  dem_le = 0
  while n > 0
    n = n / 10
    x = n %10
    if x % 2 == 0
      dem_chan = dem_chan + 1
    else
      dem_le = dem_le + 1
    end
  end
  printf "Có %d số chẵn. Có %d số lẻ", dem_chan, dem_le
end

#dem_chu_so 123

=begin
  Kiểm tra số hoàn thiện (Tổng các ước = N)
=end

def kiem_tra_so_hoan_thien n
  s = 0
  for i in 1...n
    if n % i == 0
      s = s + i
    end
  end
  if s == n
    puts 'Là số hoàn thiện'
  else
    puts 'Không phải là số hoàn thiện'
  end
end

#kiem_tra_so_hoan_thien 6

=begin
  Kiểm tra số đối xứng
  Ví dụ: 232
=end

def kiem_tra_so_doi_xung n
  nguoc = 0
  m = n
  while m > 0
    nguoc = nguoc * 10 + m%10
    m = m/10
  end
  puts nguoc
  if nguoc == n
    puts 'Là số đối xứng'
  else
    puts 'Không phải là số đối xứng'
  end
end

#kiem_tra_so_doi_xung 2112

=begin
  Chuyển số N sang nhị phân
=end

def chuyen_nhi_phan n
  i = 31
  while i >= 0
    bit = (n >> i)&1
    print bit
    i = i - 1
  end
end

def chuyen_nhi_phan_bang_mang n
  array = []
  while n > 0
    du = n % 2
    array << du
    n = n / 2
  end
  for i in 0...array.length
    print array[array.length-1-i]
  end
end

#chuyen_nhi_phan 23
#chuyen_nhi_phan_bang_mang 23

=begin
  Chuyển nhị phân sang thập phân
=end

def chuyen_thap_phan string
  n = 0
  for i in 0...16
    if string[i]
      n = n << 1
      if string[i] == '1'
        n = n | 1
      end
    end
  end
  print n
end

#chuyen_thap_phan '10111'

=begin
  Liệt kê mảng con trong mảng
=end

def mang_con_trong_mang array
  for u in 0...array.length
    for v in u...array.length
      for i in u..v
        print array[i].to_s + ','
      end
      puts
    end
  end
end

#mang_con_trong_mang [1,2,3,5,6,7,8,9]

=begin
  Tìm ra mảng con liên tiếp có tổng lớn nhất trong một mảng với tham số k là số phần tử của mảng con đó
  Ví dụ:
  Input: [1, -5, 4, 3, 6, 8, 2, 4], k = 3
  Output: [3, 6, 8]
=end

def mang_con_co_tong_lon_nhat array, k
  max = 0
  pos = 0
  temp = []
  flag = 0
  for u in 0..array.length
    mang_con = []
    if u == array.length - k + 1
      break
    end
    for v in u..u+k-1
      mang_con << array[v]
    end
    temp << mang_con
    sum = 0
    mang_con.each do |e|
      sum = sum + e
      if sum > max
        max = sum
        flag = pos
      end
    end
    pos = pos + 1
  end
  puts temp[flag].inspect
end

#mang_con_co_tong_lon_nhat [1,23,3,3,6,7,9,6], 4

=begin
  Tìm những mảng con có tổng bằng k
  Ví dụ:
  Input: [1,2,3,4,5], k = 9
  Output: [2,3,4], [4,5]
=end

def mang_con_co_tong_k array, k
  result = []
  for i in 0...array.length
    for j in i...array.length
      sum = 0
      arr = []
      for u in i..j
        arr << array[u]
        sum = sum + array[u]
      end
      if sum == k
        result << arr
      end
    end
  end
  puts result.inspect
end

#mang_con_co_tong_k [1,2,3,4,5], 9

=begin
  Liệt kê những mảng con tăng
=end

def mang_con_tang array
  result = []
  for i in 0...array.length
    for j in i...array.length
      arr = []
      for u in i..j
        arr << array[u]
      end
      flag = true
      for k in 0...(arr.length-1)
        if arr[k] > arr[k+1]
          flag = false
          break
        end
      end
      if flag
        result << arr
      end
    end
  end
  puts result.inspect
end

#mang_con_tang [1,23,3,3,6,7,9,6]



=begin
  Đảo ngược chuỗi
  Vi dụ:
  Input: "abcdef"
  output: "fedcba"
=end

def dao_nguoc_chuoi string
  result = ''
  for i in 0...string.length
    result = result + string[string.length-i-1]
  end
  puts result
end

#dao_nguoc_chuoi 'abcdefg'

=begin
  Kiểm tra cặp kí tự '(' và ')' trong chuỗi
  Ví dụ:
  Input: "()()()()(())" => Output: true
  Input: "(()()()(()" => Output: false
=end
def kiem_tra_chuoi_hop_le string
  if string[0] != '(' and string[string.length - 1] != ')'
    false
  else
    check = 0
    for i in 0...string.length
      if string[i] == '('
        check = check + 1
      elsif string[i] == ')'
        check = check - 1
      else
        return false
      end
    end
    if check == 0
      true
    else
      false
    end
  end
end

#puts kiem_tra_chuoi_hop_le '()()()()(())'

=begin
  Tìm phần tử lớn thứ k trong mảng
  Ví dụ:
  Input: [1,5,4,12,6,7,9,8], k = 3
  Output: 7
=end

def phan_tu_lon_thu_k array, k
  pos = 0
  temp = 0
  if k > 0 and k <= array.length
    for i in 0...array.length
      for j in (i + 1)...array.length
        t = 0
        if array[i] < array[j]
          t = array[i]
          array[i] = array[j]
          array[j] = t
        end
      end
      if array[i] < array[temp]
        k = k - 1
        temp = i
      end
      if k == 0
        pos = i
        break
      end
    end
    puts array[pos]
  else
    puts nil
  end
end

#phan_tu_lon_thu_k [1,5,4,12,6,7,9,8], 3

=begin
 Xóa phần tử trùng nhau trong mảng
  Ví dụ:
  Input: [1,2,3,4,5,4,4,2]
  Output: [1,2,3,4,5]
=end

def xoa_phan_tu_trung_nhau array
  new_arr = []
  array.each do |e|
    new_arr << e unless new_arr.include?(e)
  end
  # Hoặc làm cách 2
  # new_arr = array & array
  puts new_arr.inspect
end

#xoa_phan_tu_trung_nhau [1,2,3,4,5,4,4,2]

=begin
  Tìm UCLN và BCNN
=end
def ucln a, b
  if b == 0
    a
  elsif a % b == 0
    b
  else
    ucln b, a%b
  end
end

def bcnn a, b
  a*b/(ucln a, b)
end

#puts ucln 5, 3
#puts bcnn 5, 3

