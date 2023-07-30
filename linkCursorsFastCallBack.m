function output_txt = linkCursorsFastCallBack(obj,event_obj,axs)
figure(gcf)
DataTip = obj;
Line = event_obj.Target;
pos = get(event_obj,'Position');
I = get(event_obj,'DataIndex');
if ismember(Line.Parent,axs)
    %% Finding click Line
    CurrentAxes = gca;
    %CurrentAxes.Tag
    CandidLines = findobj(CurrentAxes,'type','line');
    for i = 1:size(CandidLines,1)
        LineLength(i) = length(CandidLines(i).XData);
    end
    for i = 1:length(CandidLines)
        
        [~,CandidIndex(i)] = min(abs(CandidLines(i).XData-CurrentAxes.CurrentPoint(1,1)));
        CandidValue(i) = abs(CandidLines(i).YData(CandidIndex(i))-CurrentAxes.CurrentPoint(1,2));
        if LineLength(i)~=max(LineLength)
            CandidValue(i)=inf;
        end
    end
    [~,FinInd] = min(CandidValue);
    ClickLine = CandidLines(FinInd);
    %%
    if isequal(ClickLine,Line)
        % Removing Old Tips instead that one that just clicked
        ff = gcf;
        %OldTips = findobj(findall(ff.Parent,'type','hggroup'),'class',matlab.graphics.shape.internal.PointDataTip);
        %OldTips = findall(ff.Parent,'type','hggroup');
        OldTips = findall(axs,'type','hggroup');
        jj=1;
        TipInd = [];
        for i = 1:length(OldTips)
            if ~isequal(OldTips(i),DataTip)
                TipInd(jj)=i;
                jj=jj+1;
            end
        end
        delete(OldTips(TipInd))
        
        % Ploting new tips.
        AllLines = findobj(axs,'type','line');
        FigsCount = 0;
        for i = 1:length(AllLines)
            if length(AllLines(i).XData)==length(Line.XData)&&~isequal(AllLines(i),Line)
                c = datacursormode(ancestor(AllLines(i),'figure'));
                tip = c.createDatatip(AllLines(i));
                tip.Position = [AllLines(i).XData(I),AllLines(i).YData(I)];
                tip.Cursor.DataIndex = I;
                %['Slave Mode Line Plot ',AllLines(i).Tag]
            else
                %['Slave Mode Line Plot Reject ',AllLines(i).Tag]
            end
        end
        tip.Selected = 'off';
        DataTip.Selected = 'on';
    else
        % 'Master Mode'
    end
    
end

%%

output_txt = {['X: ',num2str(pos(1),8)],...
    ['Y: ',num2str(pos(2),8)]};

% If there is a Z-coordinate in the position, display it as well
if length(pos) > 2
    output_txt{end+1} = ['Z: ',num2str(pos(3),4)];
end