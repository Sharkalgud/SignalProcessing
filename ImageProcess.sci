function y=imBlur(foo)
    [x,y]=meshgrid([4:-4],[4:-4])
    z=sqrt(x.*x+y.*y)
    h=((2*0.25)*sinc(2*z*0.25))
    h=h/(sum(sum(h)))
    y=imfilter(foo,h)
endfunction
