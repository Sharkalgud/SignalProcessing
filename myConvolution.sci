function y=myConvolution(x,h)
    y=[]
     //x=fliplr(x)
    pt1=length(x)
    pt2=1
    pt3=length(x)
    pt4=1
    for j= 0:length(x)+length(h)-2
        y(j+1)=sum(x(pt1:pt3).*h(pt4:pt2))
       // disp(y(j+1))
        if pt1>1 then
            pt1=pt1-1
        else pt3=pt3-1
        end
        if pt2<length(h) then
            pt2=pt2+1
        else pt4=pt4+1
        end
    end
endfunction
