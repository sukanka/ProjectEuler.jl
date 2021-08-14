using JET
using BenchmarkTools
using Combinatorics

function solution1(n=1000)
    s = 0
    for i in 1:n-1
        if mod(i, 3) == 0 || mod(i, 5) == 0
            s += i
        end
    end
    s
end

"""

"""
function solution2(n=4000000)
    a = 1
    b = 2
    s = 0
    while b <= n
        if iseven(b)
            s += b
        end
        a, b = b, a + b
    end
    s
end


function solution3(n=600851475143) # Pollard Rho因数分解
    k = 2
    while n != k
        if n % k == 0
            n = round(Int, n / k)
        else
            k += k == 2 ? 1 : 2
        end
    end
return k
end

function solution4(n=3) 
    maxprod=1
    for i in 10^n - 1:-1:10^(n - 1) 
        for j in i:-1:10^(n - 1)
            product = i * j
            str= "$product"
            if str == reverse(str) && product >maxprod
                maxprod=product
            end
        end
    end
    maxprod
end

function solution5(n=20)
    function gcd(a::T1, b::T2) where {T1,T2 <: Integer}
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
    function gcd(a::T) where T <: AbstractArray{<:Integer,1}
        m = a[1]
        for i in 1:length(a)
            m = gcd(m, a[i])
        end
        m
    end          
    lcm(a::T1, b::T2) where {T1,T2 <: Integer} = round(Int, a * b / gcd(a, b))
    function lcm(a::T) where T <: AbstractArray{<:Integer,1}
        m = a[1]
        for i in 1:length(a)
            m = lcm(m, a[i])
    end
    m
    end
    lcm(1:n) 
end

solution6(n=100) = sum(1:n)^2 - sum((1:n).^2)
function solution7(n=10001)
    primes = zeros(Int, n)
    primes[1:2] .= [2,3]
    k = 3
    counter = 2
    while counter < n
        k += 2
        is_prime = true
        for i in primes[2:counter]
            if k % i == 0
                is_prime = false
                break
            end
        end
        if is_prime
            counter += 1
            primes[counter] = k
        end
    end
    k
end

function solution8(cont=13)
    str = """
    73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450
    """
    str = strip(replace(str, "\n" => ""))
    max_prod = 0
    for i in 1:length(str) - cont
        s = prod(parse(Int, num) for num in str[i:i + cont - 1])
        if s > max_prod
            max_prod = s
        end
    end
    max_prod
end

function solution9(n=1000)
    for i in 1:floor(Int,n/3)
        for j in i:floor(Int,(n-i)/2)
            if  i^2+j^2==(n-j-i)^2
                return i*j*(n-i-j)
            end
        end
    end
end

function solution10(n=2000000)
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
    return sum(sieve(n))
end

function solution11(n=4)
    mat=[
08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48]
    max_t2b=maximum(prod(mat[i:i+n-1,j])  for j in 1:size(mat,2) for i in 1:size(mat,1)-n+1)
    max_l2r=maximum(prod(mat[i,j:j+n-1]) for j in 1:size(mat,2)-n+1  for i in 1:size(mat,1))
    max_diag=maximum(prod(mat[i+k,j+k] for k in 0:n-1) for j in 1:size(mat,2)-n+1 for i in 1:size(mat,1)-n+1)
    max_subdiag=maximum(prod(mat[i+k,j-k] for k in 0:n-1) for j in n:size(mat,2) for i in 1:size(mat,1)-n+1)
    maximum([max_t2b,max_l2r,max_diag,max_subdiag])
end

function solution12(n=500)
    tri_num(n)=round(Int,n*(n+1)/2)
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
    i=2
    K=tri_num(i)
    N=num_of_factors(K)
    while N<n
        i+=1
        K=tri_num(i)
        N=num_of_factors(K)
    end
    K
end

function solution13(n=10)
    nums=[
        37107287533902102798797998220837590246510135740250
        46376937677490009712648124896970078050417018260538
        74324986199524741059474233309513058123726617309629
        91942213363574161572522430563301811072406154908250
        23067588207539346171171980310421047513778063246676
        89261670696623633820136378418383684178734361726757
        28112879812849979408065481931592621691275889832738
        44274228917432520321923589422876796487670272189318
        47451445736001306439091167216856844588711603153276
        70386486105843025439939619828917593665686757934951
        62176457141856560629502157223196586755079324193331
        64906352462741904929101432445813822663347944758178
        92575867718337217661963751590579239728245598838407
        58203565325359399008402633568948830189458628227828
        80181199384826282014278194139940567587151170094390
        35398664372827112653829987240784473053190104293586
        86515506006295864861532075273371959191420517255829
        71693888707715466499115593487603532921714970056938
        54370070576826684624621495650076471787294438377604
        53282654108756828443191190634694037855217779295145
        36123272525000296071075082563815656710885258350721
        45876576172410976447339110607218265236877223636045
        17423706905851860660448207621209813287860733969412
        81142660418086830619328460811191061556940512689692
        51934325451728388641918047049293215058642563049483
        62467221648435076201727918039944693004732956340691
        15732444386908125794514089057706229429197107928209
        55037687525678773091862540744969844508330393682126
        18336384825330154686196124348767681297534375946515
        80386287592878490201521685554828717201219257766954
        78182833757993103614740356856449095527097864797581
        16726320100436897842553539920931837441497806860984
        48403098129077791799088218795327364475675590848030
        87086987551392711854517078544161852424320693150332
        59959406895756536782107074926966537676326235447210
        69793950679652694742597709739166693763042633987085
        41052684708299085211399427365734116182760315001271
        65378607361501080857009149939512557028198746004375
        35829035317434717326932123578154982629742552737307
        94953759765105305946966067683156574377167401875275
        88902802571733229619176668713819931811048770190271
        25267680276078003013678680992525463401061632866526
        36270218540497705585629946580636237993140746255962
        24074486908231174977792365466257246923322810917141
        91430288197103288597806669760892938638285025333403
        34413065578016127815921815005561868836468420090470
        23053081172816430487623791969842487255036638784583
        11487696932154902810424020138335124462181441773470
        63783299490636259666498587618221225225512486764533
        67720186971698544312419572409913959008952310058822
        95548255300263520781532296796249481641953868218774
        76085327132285723110424803456124867697064507995236
        37774242535411291684276865538926205024910326572967
        23701913275725675285653248258265463092207058596522
        29798860272258331913126375147341994889534765745501
        18495701454879288984856827726077713721403798879715
        38298203783031473527721580348144513491373226651381
        34829543829199918180278916522431027392251122869539
        40957953066405232632538044100059654939159879593635
        29746152185502371307642255121183693803580388584903
        41698116222072977186158236678424689157993532961922
        62467957194401269043877107275048102390895523597457
        23189706772547915061505504953922979530901129967519
        86188088225875314529584099251203829009407770775672
        11306739708304724483816533873502340845647058077308
        82959174767140363198008187129011875491310547126581
        97623331044818386269515456334926366572897563400500
        42846280183517070527831839425882145521227251250327
        55121603546981200581762165212827652751691296897789
        32238195734329339946437501907836945765883352399886
        75506164965184775180738168837861091527357929701337
        62177842752192623401942399639168044983993173312731
        32924185707147349566916674687634660915035914677504
        99518671430235219628894890102423325116913619626622
        73267460800591547471830798392868535206946944540724
        76841822524674417161514036427982273348055556214818
        97142617910342598647204516893989422179826088076852
        87783646182799346313767754307809363333018982642090
        10848802521674670883215120185883543223812876952786
        71329612474782464538636993009049310363619763878039
        62184073572399794223406235393808339651327408011116
        66627891981488087797941876876144230030984490851411
        60661826293682836764744779239180335110989069790714
        85786944089552990653640447425576083659976645795096
        66024396409905389607120198219976047599490197230297
        64913982680032973156037120041377903785566085089252
        16730939319872750275468906903707539413042652315011
        94809377245048795150954100921645863754710598436791
        78639167021187492431995700641917969777599028300699
        15368713711936614952811305876380278410754449733078
        40789923115535562561142322423255033685442488917353
        44889911501440648020369068063960672322193204149535
        41503128880339536053299340368006977710650566631954
        81234880673210146739058568557934581403627822703280
        82616570773948327592232845941706525094512325230608
        22918802058777319719839450180888072429661980811197
        77158542502016545090413245809786882778948721859617
        72107838435069186155435662884062257473692284509516
        20849603980134001723930671666823555245252804609722
        53503534226472524250874054075591789781264330331690
        ]
    s=sum(nums)
    return parse(Int,"$s"[1:n])
end
function solution14(n=1000000)
    n>1 || return 1
    f(n)= n%2==0 ? round(Int,n/2) : 3n+1
    function l(n)
        n> 1 || return 1
        a=n
        l=1
        while f(a) >1
            a=f(a)
            l+=1
        end
        l+=1
    end
    lengths=l.(2:n)
    findfirst(lengths.== maximum(lengths))+1 # 从2开始
end

function solution15(n=20)
    dict=Dict(i=> true for i in 1:n)
    s=1
    for j in n+1:2n
        s*=j
        for i in 1:n
            if dict[i] && s%i==0
                s=round(Int,s/i)
                dict[i]=false
            end
        end
    end
    s
end

solution16(n=1000)=sum(digits((BigInt(2))^n))
function solution17(n=1000)
    number2word =Dict(
    0=>"",
    1=>"one",
    2=>"two",
    3=>"three",
    4=>"four",
    5=>"five",
    6=>"six",
    7=>"seven",
    8=>"eight",
    9=>"nine",
    10=>"ten",
    11=>"eleven",
    12=>"twelve",
    13=>"thirteen",
    14=>"fourteen",
    15=>"fifteen",
    16=>"sixteen",
    17=>"seventeen",
    18=>"eighteen",
    19=>"nineteen",
    20=>"twenty",
    30=>"thirty",
    40=>"forty",
    50=>"fifty",
    60=>"sixty",
    70=>"seventy",
    80=>"eighty",
    90=>"ninety", 
    100=>"hundred",
    1000=>"one thousand",
    )
    function num2text(m)
        @assert m <=1000
        m==100 && return "one hundred"
        if m in keys(number2word)
            return number2word[m]
        elseif m <100 
            d=m -m %10
            m=m-d
            return num2text(d)*" "* num2text(m)
        else
            h=m-m%100
            m=m-h
            h=div(h,100)
    
            return num2text(h)*" hundred"*(m!=0 ? " and " *num2text(m) : "")
        end
    end
    lettercount=0
    for i in 1:n
        lettercount+=length(replace(num2text(i)," "=>""))
    end
    lettercount 
end


function solution18()
    nums = [
        [75],
        [95 64],
        [17 47 82],
        [18 35 87 10],
        [20 04 82 47 65],
        [19 01 23 75 03 34],
        [88 02 77 73 07 63 67],
        [99 65 04 28 06 16 70 92],
        [41 41 26 56 83 40 80 70 33],
        [41 48 72 33 47 32 37 16 94 29],
        [53 71 44 65 25 43 91 52 97 51 14],
        [70 11 33 28 77 73 17 78 39 68 17 57],
        [91 71 52 38 17 14 91 43 58 50 27 29 48],
        [63 66 04 68 89 53 67 30 73 16 69 87 40 31],
        [04 62 98 27 23 09 70 98 73 93 38 53 60 04 23]]
    rows=length(nums)
    rows> 1 || return maximum(nums[1])
    cols=maximum(length.(nums))
    dist=zeros(Int,(rows,cols))
    dist[1,1]=nums[1][1]
    for i in 2: rows
        dist[i,1]=nums[i][1]+dist[i-1][1]
    end
    for i in 2:rows
        for j in 2:length(nums[i])
            dist[i,j]=nums[i][j]+max(dist[i-1,j],dist[i-1,j-1])
        end
    end
    maximum(dist[rows,:])
end

function solution19()
    Y=1901
    M=1
    D=1
    W=1
    cnt=0
    leap_year(Y)= (Y%4==0 && Y%100 !=0) || Y%400==0
    function days_in_month(M,Y)
        dict=Dict{Int,Int}(1=>31, 2=> 28,3=>31,4=>30,5=>31,6=>30,7=>31,8=>31,9=>30,10=>31,11=>30,12=>31)
        if leap_year(Y)
            dict[2]+=1
        end
        dict[M]
    end
    function date_add_one(Y,M,D)
        days=days_in_month(M,Y)
        if D==days
            D=1
            if M<12
                M+=1
            else
                Y+=1
                M=1
            end
        else
            D+=1
        end
        Y,M,D
    end
    weekday_add_one(W)= W<7 ? W+1 : 1
    while Y<=2000 && M<=12 && D<=31
        if D==1 && W==7
            cnt+=1
        end
        Y,M,D=date_add_one(Y,M,D)
        W=weekday_add_one(W)
    end
    cnt
end

solution20(n=100)=sum(digits(prod(1:BigInt(n))))

function solution21(n=10000)
    d(n)::Int=sum(x for x in 1:n-1 if n%x==0) # n>=2
    s=0
    for i in 2:n
        t=d(i)
        if t >1 && t <=n && d(t)==i && t!=i # 一个数不能构成亲和数
            s+=i
        end
    end
    s
end

function solution22()
    char2num(s)=Int(lowercase(s))-Int('a')+1
    name_score(name,idx)=sum(char2num(c) for c in name)*idx
    names = sort(split(replace(read("names.txt",String),"\""=>""),","))
    sum(name_score(names[i],i) for i in 1:length(names))
end

function solution23()
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
    abundants=(1:28123)[is_abundant.(1:28123)]
    function is_sum_of_two_abundant(n)
        n>=24 || return false
        for i in abundants
            if   i <n && (n-i) in abundants
                return true
            end
        end
        return false
    end
    sum(x for x in 1:28123 if !is_sum_of_two_abundant(x))
end


function solution24(n=1000000)
    nums=collect(0:9)
    P=permutations(nums)
    i=0
    for p in P
        i+=1
        if i ==n
            return collect(p)
        end
    end
end

function solution25(dig=1000)
    a = BigInt(1)
    b = BigInt(1)
    n = 2
    digits_n=length(digits(b))
    while digits_n <dig
        a,b=b,a+b
        n+=1
        digits_n=length(digits(b))
    end
    return n
end

function  solution26(n=1000)
    rems=zeros(n)
    function cyclelen(x::Integer)
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
    lens=cyclelen.(1:1000)
    findmax(lens)[2]
   
    
end
solution26()

function solution27(ub=1000)
    maxcnt=0
    a0=0
    b0=0
    for a in -(ub-1):(ub-1)
        for b in -(ub-1):(ub-1)
            mycnt = primecounter(n-> n*n+a*n+b)
            if mycnt >= maxcnt
                a0=a
                b0=b
                maxcnt=mycnt
            end
        end
    end
    return a0*b0
end
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
# @enter solution27()

solution27()

function solution28(w::Integer=1001)
    @assert isodd(w)
    a(n)=n*n # anti-clockwise
    b(n)=a(n)-n+1
    c(n)=b(n)-n+1
    d(n)=c(n)-n+1
    s=0
    for i in 1:div(w,2)+1
        s+=a(2i-1)+b(2i-1)+c(2i-1)+d(2i-1)
    end
    s-=3 # 1 has been added for 4 times
end
    
solution28()

function solution29(n=100)
    list=zeros(BigInt,99*99)
    i=1
    for a in 2:100
        for b in 2:100
            list[i]=BigInt(a)^b
            i+=1
        end
    end
    length(unique(list))
end

solution29()


function solution30(k=5)
    d=length(digits(9^k))+1
    sp_nums=Int[]
    for i in 2:10^d
        if i== sum(x->x^k,digits(i))
            push!(sp_nums,i)
        end
    end
    sum(sp_nums)
end

solution30()


function solution31(n::Int=200)
    currency=Int[1,2,5,10,20,50,100,200]
    cnt=0
    for c200 in 0:div(n,200)
        for c100 in 0:div(n,100)
            for c50 in 0:div(n,50)
                for c20 in 0:div(n,20)
                    for c10 in 0:div(n,10)
                        for c5 in 0:div(n,5)
                            for c2 in 0:div(n,2)
                                for c1 in 0:n
                                    t=c1+2c2+5c5+10c10+20c20+50c50+100c100+200c200
                                    if t==n
                                        cnt+=1
                                    elseif t>n
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    cnt
end


function solution32()
    # This function is fairly slow!
    # 1000 x 1000= 1000,000,  10 digits!
    p=Set(0) # Initialization
    for a in 1:10000
        for b in a:10000
            c=a*b
            digs=vcat(digits(a),digits(b),digits(c))
            if length(digs)==9 && sort(digs)==collect(1:9)
                push!(p,c)
            end
        end
    end
    sum(p)
end

function solution33()
    # 49/98=1/2
    # 30/50=3/5
    # 2*2*5*5=100
    100
end


function solution34()
    factof1to9=collect(0:9)
    factof1to9[1]=1
    for i in 2:10
        factof1to9[i]=factof1to9[i-1]*(i-1)
    end
    s=0
    ub=sum(factof1to9)
    for k in 10:ub
        if k == sum(factof1to9[digits(k).+1])
            s+=k
        end
    end
    s
end