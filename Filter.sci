function y=LowPass(x,fs)
    //1837.5
    H=[]
    fc=int((700*2001)/(fs))+1
    H(1)=1
    for j= 2:2001
        if j<=fc | j>=length(x)-fc then
            H(j)=1
        else
            H(j)=0
        end
    end
    temp=real(fft(H))
    h=[]
    h(1)=temp(int(length(temp)/2):length(temp))
    h(2)=temp(1:int(length(temp)/2)-1)
    plot(h)
endfunction
