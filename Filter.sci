function y=LowPass(x,fs)
    //1837.5
    //sound(x)
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
    temp=temp/length(temp)
    y=temp
    //h=[temp(int(length(temp)/2):length(temp)) temp(1:int(length(temp)/2)-1)]
    h=[temp(int(length(temp)/2): length(temp) )', temp(1:int(length(temp)/2))']
    y= conv(x,h)
    sound(y)
    //plot(h)
endfunction

function y=BandPass(x,fs)
    //1837.5
    //sound(x)
    H=[]
    fcindex=round((1475*2001)/(fs))+1
    H(1)=1
    for j= 2:2001
        if j<=fcindex | j>=length(x)-fcindex then
            H(j)=0
        else
            H(j)=1
        end
    end
    temp=real(fft(H))
    y=temp
    //h=[temp(int(length(temp)/2):length(temp)) temp(1:int(length(temp)/2)-1)]
    h=[temp(int(length(temp)/2): length(temp) )', w(1:int(length(temp)/2))']
    y= conv(x,h)
    plot(h)
    sound(y)
endfunction
