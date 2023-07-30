# linkCursors
a Matlab code for linking cursors of several axes
All of the input axes even in different figures will become linked.

![image](https://github.com/aliamini87/linkCursors/assets/91720545/5be8eea0-556c-4d33-841d-dac9f7891130)

## examples
```matlab
linkCursors([ax1,ax2,ax3])
linkCursors([ax1,ax2,ax3],'Default')
linkCursors([ax1,ax2,ax3],'Fast')
```
## options available:
 - 'Default' : It is the complete version. In addition to when clicking, It update all of the selected cursors when you use right
 and left arrows. In some systems with limited resources, it may cause lag. Without a specified option, the default mode is considered.
 - 'Fast' : I ommited the update functionality when left and right arrow pressed so it is faster. But left and right arrow
 update doesn't work properly.
## notice : 
- 'datatipinteraction' become disabled by this function.
-  In some versions all the default interactivity become disabled by this function.

## Cite As
ali amini (2023). linkCursors (https://www.mathworks.com/matlabcentral/fileexchange/78405-linkcursors), MATLAB Central File Exchange. Retrieved July 30, 2023.
