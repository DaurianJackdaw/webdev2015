# Homework 3 of Web Development Class 
# at The Affiliated High School of Peking University
# by Yuci Zhou

# For the Prompt:
# Prime generator

def is_prime(n)
	while 2..Math.sqrt(n)
		if n % i == 0
			return false
		end
	end
	true
end


def prime_generator(n)
	for prime in 2..n
		if is_prime(prime)
			puts prime
		end
	end
end


prime_generator(100000)

