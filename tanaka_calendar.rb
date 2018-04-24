class Calendar
  
  def inputym
    p "�J�����_�[��\�����������N�������L����������"
    p "��F2018�N6�� �� 201806"
    ym = gets.chomp
    @year = ym.slice(0,4).to_i
    @month = ym.slice(4,2).to_i
  end  #class input�����܂�
  
  
  def create_calender
    
    m = @month.to_i  #���͂��ꂽ��
    mon_arr = ["January","February","	March","April","May","June",
              "July","August","September","October","November","December"]
    mon_name = mon_arr[m-1]
    year = @year
    day_num = 0
    
    #���邤�N�̔���
    if @year % 400 == 0
      uruu = 1
    elsif @year % 100 == 0
      uruu = 0
    elsif @year % 4 == 0
      uruu = 1
    else
      uruu = 0
    end
    
    #day�̐�����U��
    if m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12
      day_num = 31
    elsif m == 4 || m == 6 || m == 9 || m == 11
      day_num = 30
    elsif uruu == 1
      day_num = 29
    else
      day_num = 28
    end
    
    #�c�F���[�̌������g��
    if m == 1
      m = 13
      @year -= 1
    elsif m == 2
      m = 14
      @year -= 1
    end
    
    @year = @year.to_s
    h = @year.slice(0,2).to_i
    y = @year.slice(2,2).to_i
    
    x1 = y / 4
    x2 = h / 4
    x3 = 13 * (m + 1) / 5
    
    w = y + x1.floor + x2.floor - (2 * h) + x3.floor + 1
    w = (w + 6) % 7
    
    #�o�͂�����t��󔒂�z��ɓ����
    day_arr = []
    
    w.times do
      day_arr << "   "
    end
    
    day_num.times do |n|
      day_arr << n + 1
    end
    
    i = 1
    
    print "----------------------------\n"
    print "#{mon_name}, #{year}".center(28)
    print "\nSun Mon Tue Wed Thu Fri Sat\n"
    
    #�������o�́B7���Ƃɉ��s����B
    day_arr.each do |n|
      if n != "   " && i % 7 == 0
        print format("%3d", "#{n}")
        print "\n"
      elsif n != "   "
        print format("%3d", "#{n}")
        print " "
      else
        print "#{n}"
        print " "
      end
      i += 1
    end
    
    print "\n----------------------------\n"
  end  #class create_calender�����܂�
  
end  #class Calendar�����܂�


cla = Calendar.new
cla.inputym
cla.create_calender