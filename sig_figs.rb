# removes 0s from string number
def remove_trailing_0(num)
	num = num.split("")
	scan = true
	while scan
		digit = num.pop
		if digit != '0'
			scan = false
			num << digit
		end
	end
	num
end

# counts number of sig figs in a number
def sig_figs(num)
  	num = num.to_s
  	sig_figs = 0
  	if num.include?(".")
    	split_num = num.split(".") 
    	sig_figs += split_num[0].length
    	sig_figs += remove_trailing_0(split_num[1]).length
    else
    	sig_figs += remove_trailing_0(num).length
    end
    sig_figs
end


#rounds a string number
def round(number, last_sig_fig)
	number = number.split("")
	num = number[0,last_sig_fig]
	if number[last_sig_fig].to_i >= 5
		last =  num[-1].to_i
		last +=1
		num.pop
		num << last
	end
	num.join
end

#displays a number to a certain number of sig figs
def display(num, sig_figs)
	num = num.to_s
	if num.include?(".")
		#split the number into integer and decimal portions
		split_num = num.split(".")
		int_num = split_num[0]
		dec_num = split_num[1]

		#if sig figs affect the decimal portion
		if int_num.length < sig_figs
			sig_figs -= int_num.length
			#round num at sig fig position
			dec_num = round(dec_num,sig_figs) 
			num = int_num + '.'+ dec_num
			num = num.to_f

		# if sig figs only affect the integer portion
		else
			int_num_length = int_num.length
			#round num at sig fig position
			full_num = int_num + dec_num
			num = round(full_num,sig_figs)
			#adding any missing 0s 
			if num.length < int_num_length
				p num
				num = num.join + "0"*(int_num_length-num.length)
			end
			num = num.to_i
		end
	end
	num
end

#tests
p display(520.6255000,5)
p display(520.6245000,5)
p display(525.6245000,3)
p display(525.4245000,3)