function y=LowPass(x,fs)
    //1837.5
    H=[]
    fcindex=round((700*2001)/(fs))+1
    H(1)=1
    for j= 2:2001
        if j<=fcindex | j>=length(x)-fcindex then
            H(j)=1
        else
            H(j)=0
        end
    end
    temp=real(fft(H))
    h=[temp(int(length(temp)/2):length(temp)) temp(1:int(length(temp)/2)-1)]
    plot(h)
endfunction
