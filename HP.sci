function y=HP(x,fs)
    //1837.5
    //sound(x)
    H=ones(1,2001)'
    fcindex=round((1475*2001)/(fs))-1
    disp(fcindex)
    for j= 2:2001
        if j<=fcindex | j>=length(x)-fcindex then
            H(j)=0
        else
            H(j)=1
        end
    end
    temp=real(fft(H))
    y=temp
    temp=temp/length(temp)
    //h=[temp(int(length(temp)/2):length(temp)) temp(1:int(length(temp)/2)-1)]
    h=[temp(int(length(temp)/2): length(temp) )', temp(1:int(length(temp)/2))']
    y= conv(x,h)
    plot( fs*[0:length(y)-1]/length(y),abs( fft(y)), 'k+-')
 //   plot( h, 'k+-')
    //plot(h)
//    plot(y)
endfunction
