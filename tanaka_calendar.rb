class Calendar
  
  def inputym
    p "�J�����_�[��\�����������N�������L����������"
    p "��F2018�N6�� �� 201806"
    yyyymm = gets.chomp.to_i
    @yyyy = yyyymm / 100
    @mm = yyyymm % 100
  end  #class input�����܂�
  
  
  def uruu?
    @yyyy % 400 == 0 || @yyyy % 100 != 0 && @yyyy % 4 == 0
  end
  
  
  def create_calender
    inputym
    
    m = @mm  #���͂��ꂽ��
    mon_arr = ["January","February","	March","April","May","June",
              "July","August","September","October","November","December"]
    mon_name = mon_arr[m-1]
    mon31_arr = [1,3,5,7,8,10,12]
    mon30_arr = [4,6,9,11]
    
    year = @yyyy
    day_num = 0
    
    #day�̐�����U��
    if mon30_arr.include?(m)
      day_num = 30
    elsif mon31_arr.include?(m)
      day_num = 31
    elsif uruu?
      day_num = 29
    else
      day_num = 28
    end
    
    #�c�F���[�̌������g��
    if m == 1
      m = 13
      @yyyy -= 1
    elsif m == 2
      m = 14
      @yyyy -= 1
    end
    
    h = @yyyy / 100
    y = @yyyy % 100
    
    x1 = y / 4
    x2 = h / 4
    x3 = 13 * (m + 1) / 5
    w = y + x1 + x2 - (2 * h) + x3 + 1
    w = (w + 6) % 7
    
    #�o�͂�����t��󔒂�z��ɓ����
    day_arr = []
    
    w.times do
      day_arr << "   "
    end
    
    day_num.times do |n|
      day_arr << n + 1
    end
    
    #day_arr << (1..day_num).to_a
    
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
cla.create_calender