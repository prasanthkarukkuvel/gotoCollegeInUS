module ApplicationHelper

	def hash_me(s)
		Digest::MD5.hexdigest(s)
	end

	def hash_me_with_time(s)
		Digest::MD5.hexdigest(Digest::SHA1.hexdigest(s)+Time.now.to_s)
	end

	def hash_me_with_data(s,d)
		Digest::MD5.hexdigest(Digest::SHA1.hexdigest(s)+d)
	end

	def hash_me_by_range(s,n)
		if n <= 32
			Digest::MD5.hexdigest(s)[0..n.to_i]
		else
			Digest::MD5.hexdigest(s)[0..8]
		end
	end

	def hash_me_with_time_by_range(s,n)
		if n <= 32
			Digest::MD5.hexdigest(Digest::SHA1.hexdigest(s)+Time.now.to_s)[0..n.to_i]
		else
			Digest::MD5.hexdigest(Digest::SHA1.hexdigest(s)+Time.now.to_s)[0..8]
		end
	end

	def hash_me_with_data_by_range(s,d,n)
		if n < 32
			Digest::MD5.hexdigest(Digest::SHA1.hexdigest(s)+d)[0..n.to_i]
		else
			Digest::MD5.hexdigest(Digest::SHA1.hexdigest(s)+d)[0..8]
		end
	end

	def srand(n)
		((0..9).to_a+('a'..'z').to_a).shuffle[1..n.to_i].join("")
	end

	def srand_num(n)
		if n <= 9 
			(0..9).to_a.shuffle[1..n.to_i].join("")
		else
			(0..9).to_a.shuffle[1..5].join("")
		end
	end

	def srand_txt(n)
		if n <= 9 
			('a'..'z').to_a.shuffle[1..n.to_i].join("")
		else
			('a'..'z').to_a.shuffle[1..5].join("")
		end
	end

end
