# Auxiliary functions 
function gcd(a::Integer, b::Integer) 
    if a > b
        return gcd(b, a)
    else
        c = b % a
        if c == 0
            return a
            else return gcd(a, c)
        end
    end
end

function gcd(a::Vector{Integer})
    m = a[1]
    for i in 1:length(a)
        m = gcd(m, a[i])
    end
    m
end

lcm(a::Integer, b::Integer) = round(Int, a * b / gcd(a, b))

function lcm(a::AbstractVector{<:Integer})
    m = a[1]
    for i in 1:length(a)
        m = lcm(m, a[i])
    end
m
end

"""
    sieve(n)
Sieve of Eratosthenes, finding all prime numbers up to `n`, see https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
"""
function sieve(n)
    is_prime=trues(n)
        for i in 2:ceil(Int,√n)
            if is_prime[i]
                for j in i^2:i:n
                    if j %i==0
                        is_prime[j]=false
                    end
                end
            end
        end
    return (x for x in 2:n if is_prime[x])
end

function num_of_factors(n)
    n> 1 || return 1
    key=0 
    val=0
    s=1
    k=2
    while n!=k
        if n %k==0
        key=k
        val+=1
            n=round(Int,n/k)
        else
        s*=val+1
        val=0
            k+= k==2 ? 1 : 2
        end
    end
    n==key ? val+=1 : val=1
    s*=val+1
end

function is_abundant(n)
    n>=12 || return false
    s=1
    i=2
    while i*i <=n
        a= n%i
        b=div(n,i)
        if a==0 
            if i != b
                s+=i+b
            else 
                s+=i
            end 
        end
        i+=1
        if s > n
            return true
        end
    end
    return false
end

"""
    cyclelen(x::Integer)
length of Reciprocal cycles
"""
function cyclelen(x::Integer)
    rems=zeros(x)
    loc=1
    @assert x>=1
    r=1
    d,r=divrem(r,x)
    while r!=0
        rems[loc]=r
        r*=10
        d,r=divrem(r,x)
        t=findfirst(x->x==r,rems[1:loc]) #第一个相同位置
        loc+=1 # 当前位置
        if !isnothing(t)
            return loc-t
        end
    end
    return 0
end

"""
    primecounter(f::Function)
return the amount of  prime numbers  generated by `f`.
"""
function primecounter(f::Function)
    x=0
    out=f(x)
    cnt=0
    while isprime(out)
        cnt+=1 
        x+=1
        out=f(x)
    end
    return cnt
end

function isprime(n::Integer)
    n<= 1 && return false
    if iseven(n) && n!=2 
        return false
    end
    if n==3 
        return true
    end
    i=3
    while i*i <=n
        if n%i ==0
            return false
        end
        i+=2
    end
    return true
end

"""
    cycles(n)
return circular numbers generated by `n`, eg. 123 gives [123,231,312].
"""
function cycles(n)
    @assert n>=0
    if n <10
        return [n]
    end
    digs=digits(n)
    d=length(digs)
    cyc=zeros(Int,d)
    x=[10^i for i in 0:d-1]
    for i in 1:d
        cyc[i]=sum(x .* digs[vcat(i:d,1:i-1)])
    end
    return cyc
end

function istruncatableprime(n)
    @assert n >10
    if !isprime(n)
        return false
    else 
        str=string(n)
        flag=true
        for i in 1:length(str)-1
            a=parse(Int,str[1:i])
            b=parse(Int,str[i+1:end])
            if !isprime(a) || !isprime(b)
                flag=false
                break
            end
        end
        return flag
    end 
end