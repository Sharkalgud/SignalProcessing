  //Lab 2 - DMTF Detection/ Time Frequency Analysis
function y = myFunction(x,fs)// method for discrete fourier transform
    N=length(x);
    n=[0:N-1]/N;
    y=[];
    for j=0:N-1
        y(j+1)=sum(x.*cos(2*%pi*j*n))-sum(%i*x.*sin(2*%pi*j*n));
    end
endfunction
function foo=numberTone(x, fs)
    foo=zeros(400,length(x)/45)//make array of all zeros y is frequency and x is time
    count=1
    for j= 0:45:length(x)-400// for loop goes through each column of array and adds frequency values of fourier transform
        tempVal = myFunction(x(j+1:j+400),fs); //takes the fft of the small interval
        foo(:,count)=abs(tempVal);
        count=count+1
    end
    imagesc(foo);
endfunction
function y=findpeaks(org,fs,num)// org is the original sound, fs is the sampling frequency and num is the number of numbers I will be looking for
     y=''
     masterc=1
     ptr=1
     for mitr= masterc:num // iterates over the seperate tones
        x=org(ptr:ptr+4500)// isolation of a specific tone
        ptr=ptr+6500
        foo=diff(sign(diff(abs(myFunction(x))))) // function used to determine the desired peaks
         arr=abs(myFunction(x))
         r=[]
         ama=[]
         temp=foo(1:length(foo)/2)
         count=1
         for j= 0:(length(foo)/2)-1 // the result of the above function is cut in half since the other half of the result is a mirror image of the first half
             if foo(j+1)==-2 then
                 r(count)= j+1
                 ama(count)=arr(j+1)
                 count=count+1
             end
         end
         [xx,inds]=gsort(ama)// sorts the different peaks
         l=[]
         for j= 0:1
             l(j+1)=fs*(r(inds(j+1))/length(arr)) // finds the corresponding frequencies in the high and low group
         end
         // this next part does the touch tone analysis
         low=0
         high=0
         av1l= (770+697)/2
         av0l= 697-(av1l-697)
         av2l= (852+770)/2
         av3l= (941+852)/2
         av4l= 941+(941-av3l)
         av1h= (1336+1209)/2
         av0h= 1209-(av1h-1209)
         av2h= (1477+1336)/2
         av3h= 1477+(1477-av2h)
         if av0l<=l(2) & l(2)<av1l then
             low=1
         end
         if av1l<=l(2) & l(2)<av2l then
             low=2
         end
         if av2l<=l(2) & l(2)<av3l then
             low=3
         end
         if av3l<=l(2) &l(2)<=av4l then
             low=4
         end
         if av0h<=l(1) & l(1)<av1h then
             high=1
         end
         if av1h<=l(1) & l(1)<av2h then
             high=2
         end
         if av2h<=l(1) & l(1)<=av3h then
             high=3
         end
         number=['1','2','3';'4','5','6';'7','8','9';'*','0','#'] 
         y= y+" "+number(low, high)
         masterc=masterc+1
      end
endfunction
