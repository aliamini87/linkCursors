function linkCursors(axs,varargin)
% This function links input axes cursors.
% axs: is the vector of axes to be linked.
%options available:
% - 'Default' : It is the complete version. In addition to when clicking,
%               It update all of the selected cursors when you use right
%               and left arrows. In some systems with limited resources,
%               it may cause lag.
% - 'Fast'    : I ommited the update functionality when left and right
%               arrow pressed so it is faster. But left and right arrow
%               update doesn't work properly.

% notice : - without option the default mode is used.
%        : - 'datatipinteraction' become disabled by this function. In some
%            versions all the default interactivity become disabled by this
%            function.

% examples:  - linkCursors([ax1,ax2,ax3])
%            - linkCursors([ax1,ax2,ax3],'Default')
%            - linkCursors([ax1,ax2,ax3],'Fast')


if isempty(varargin)
    Mode = 'Default';
else
    Mode = varargin{1};
end


switch Mode
    case 'Default'
        for i = 1:length(axs)
            c = datacursormode(ancestor(axs(i),'figure'));
            set(c,'UpdateFcn',{@linkCursorsCallBack,axs})
            if verLessThan('matlab','9.6')
                if verLessThan('matlab','9.5')
                else
                    disableDefaultInteractivity(axs(i))
                end
            else
                axs(i).Interactions = [panInteraction rulerPanInteraction zoomInteraction];
            end
        end
        
    case 'Fast'
        for i = 1:length(axs)
            c = datacursormode(ancestor(axs(i),'figure'));
            set(c,'UpdateFcn',{@linkCursorsFastCallBack,axs})
            if verLessThan('matlab','9.6')
                if verLessThan('matlab','9.5')
                else
                    disableDefaultInteractivity(axs(i))
                end
            else
                axs(i).Interactions = [panInteraction rulerPanInteraction zoomInteraction];
            end
        end
        
    otherwise
        warning('Option is not defined! Default version considered.');
        for i = 1:length(axs)
            c = datacursormode(ancestor(axs(i),'figure'));
            set(c,'UpdateFcn',{@linkCursorsCallBack,axs})
            if verLessThan('matlab','9.6')
                if verLessThan('matlab','9.5')
                else
                    disableDefaultInteractivity(axs(i))
                end
            else
                axs(i).Interactions = [panInteraction rulerPanInteraction zoomInteraction];
            end
        end
end


datacursormode off