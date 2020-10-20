class TimeChecker
  within_24_hours_check = /^([1-2][0-3]|[0-9])$/
  warning = "0から23の値を入力してください"

  puts "確認したい時刻の数字を入力してください"
  times_of_day_inputs = gets
  if times_of_day_inputs.match(within_24_hours_check) != nil
    times_of_day = times_of_day_inputs.to_i
  else
    puts warning
    exit
  end
  puts "開始時刻の数字を入力してください"
  start_at_inputs = gets
  if start_at_inputs.match(within_24_hours_check) != nil
    start_at = start_at_inputs.to_i
  else
    puts warning
    exit
  end
  puts "終了時刻の数字を入力してください"
  end_at_inputs = gets
  if end_at_inputs.match(within_24_hours_check) != nil
    end_at = end_at_inputs.to_i
  else
    puts warning
    exit
  end

  if start_at < end_at
    start_to_end = Range.new(start_at, end_at-1).to_a
  elsif start_at == end_at
    start_to_end = Range.new(start_at, end_at).to_a
  elsif end_at == 0
    start_to_end = Range.new(start_at, 23).to_a
  end
  
  if start_at < end_at || start_at == end_at
    if start_to_end.include?(times_of_day)
      puts "確認したい時刻は、指定した時間の範囲内に含まれます。"
    else
      puts "確認したい時刻は、指定した時間の範囲内に含まれません。"
    end
  elsif end_at < start_at
    day_before = start_at..23
    if end_at != 0
      day_after = 0..end_at
    else
      day_after = day_before
    end
    if day_before.include?(times_of_day) || day_after.include?(times_of_day)
      puts "確認したい時刻は、指定した時間の範囲内に含まれます。"
    else
      puts "確認したい時刻は、指定した時間の範囲内に含まれません。"
    end
  end
end