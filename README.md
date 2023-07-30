# linkCursors
a Matlab code for linking cursors of several axes
All of the input axes even in different figures will become linked.

<p align="center">
<img src="https://github.com/aliamini87/linkCursors/assets/91720545/c3329526-16df-4970-a321-fc2b0f7a75a8" width="607" height="507">
</p>


## Syntax
```matlab
linkCursors([ax1,ax2,ax3])
linkCursors([ax1,ax2,ax3],'Default')
linkCursors([ax1,ax2,ax3],'Fast')
```
## Description
 - 'Default' : It is the complete version. In addition to when clicking, It update all of the selected cursors when you use right
 and left arrows. In some systems with limited resources, it may cause lag. Without a specified option, the default mode is considered.
 - 'Fast' : I ommited the update functionality when left and right arrow pressed so it is faster. But left and right arrow
 update doesn't work properly.

## Example
```matlab
x = [0:0.01:10];
y1 = sin(x);
y2 = sin(2*x);
y3 = cos(0.5*x);
y4 = x;
y5 = 2*y1-y2;

f = figure;
subplot(3,2,[1,3,5])
plot(x,y1);
subplot(3,2,2)
plot(x,y2);
subplot(3,2,4)
plot(x,y3);
subplot(3,2,6)
plot(x,y4);

f2 = figure;
plot(x,y2);

axs1 = findobj(f,'type','axes');
axs2 = findobj(f2,'type','axes');
axs = [axs1;axs2];

linkCursors(axs);
```

## notice : 
- 'datatipinteraction' become disabled by this function.
-  In some versions all the default interactivity become disabled by this function.

## Todo
- Adding the support to other plots such as scatter. (Now only line plots are supported)

## Cite As
ali amini (2023). linkCursors (https://www.mathworks.com/matlabcentral/fileexchange/78405-linkcursors), MATLAB Central File Exchange. Retrieved July 30, 2023.
