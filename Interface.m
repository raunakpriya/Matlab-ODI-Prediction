classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        SCOREBOARDUIFigure             matlab.ui.Figure
        PerformanceAgainstButtonGroup  matlab.ui.container.ButtonGroup
        AllTeamsButton                 matlab.ui.control.RadioButton
        TheOpponentButton              matlab.ui.control.RadioButton
        WhereDropDownLabel             matlab.ui.control.Label
        WhereDropDown                  matlab.ui.control.DropDown
        TimeSpanDropDownLabel          matlab.ui.control.Label
        TimeSpanDropDown               matlab.ui.control.DropDown
        StartButton                    matlab.ui.control.Button
        StopButton                     matlab.ui.control.Button
        ResetButton                    matlab.ui.control.Button
        GetDataButton                  matlab.ui.control.Button
    end


    methods (Access = private)
    
        function loaddata(app,selectedButton,WhereValue,TimeValue)
            if strcmp(selectedButton,'All Teams')
                if strcmp(WhereValue,'All Competitions')
                    workbookFile='Data1.xlsx';
                    if strcmp(TimeValue,'Since Beiginning')
                        sheetName='All';
                        endrow=28;
                    elseif strcmp(TimeValue,'Last 10 years')
                        sheetName='10Y'
                        endrow=22;
                        elseif strcmp(TimeValue,'Last 5 years')
                        sheetName='5Y'
                        endrow=21;
                       elseif strcmp(TimeValue,'Last 3 years')
                        sheetName='3Y'
                        endrow=19;
                       elseif strcmp(TimeValue,'Last 2 years')
                        sheetName='2Y'
                        endrow=19;
                        elseif strcmp(TimeValue,'Last 1 year')
                        sheetName='1Y'
                        endrow=19;
                    end
                elseif strcmp(WhereValue,'In WorldCup')
                    workbookFile='Data1.xlsx';
                    if strcmp(TimeValue,'Since Beiginning')
                        sheetName='All';
                        endrow=28;
                    elseif strcmp(TimeValue,'Last 10 years')
                        sheetName='10Y'
                        endrow=22;
                        elseif strcmp(TimeValue,'Last 5 years')
                        sheetName='5Y'
                        endrow=21;
                       elseif strcmp(TimeValue,'Last 3 years')
                        sheetName='3Y'
                        endrow=19;
                       elseif strcmp(TimeValue,'Last 2 years')
                        sheetName='2Y'
                        endrow=19;
                        elseif strcmp(TimeValue,'Last 1 year')
                        sheetName='1Y'
                        endrow=19;
                    end
                elseif strcmp(WhereValue,'England')
                    workbookFile='Data1.xlsx';
                    if strcmp(TimeValue,'Since Beiginning')
                        sheetName='All';
                        endrow=17;
                    elseif strcmp(TimeValue,'Last 10 years')
                        sheetName='10Y'
                        endrow=11;
                        elseif strcmp(TimeValue,'Last 5 years')
                        sheetName='5Y'
                        endrow=11;
                       elseif strcmp(TimeValue,'Last 3 years')
                        sheetName='3Y'
                        endrow=11;
                       elseif strcmp(TimeValue,'Last 2 years')
                        sheetName='2Y'
                        endrow=11;
                        elseif strcmp(TimeValue,'Last 1 year')
                        sheetName='1Y'
                        endrow=4;
                    end
                       
                       
        end
        app.Result_Matd=dataImport(workbookFile,sheetName,endRow);
        app.Result_Tab=[];
            elseif strcmp(selectedButton,'The Opponent')
                if strcmp(whereValue,'All Competitions')
                    workbookFile='Data1.xlsx';
                     if strcmp(TimeValue,'Since Beiginning')
                        sheetName='All';
                        endrow=677;
                    elseif strcmp(TimeValue,'Last 10 years')
                        sheetName='10Y'
                        endrow=501;
                        elseif strcmp(TimeValue,'Last 5 years')
                        sheetName='5Y'
                        endrow=393;
                       elseif strcmp(TimeValue,'Last 3 years')
                        sheetName='3Y'
                        endrow=325;
                       elseif strcmp(TimeValue,'Last 2 years')
                        sheetName='2Y'
                        endrow=285;
                        elseif strcmp(TimeValue,'Last 1 year')
                        sheetName='1Y'
                        endrow=205;
                     end
                elseif strcmp(whereValue,'In WorldCup')
                    workbookFile='Data1.xlsx';
                     if strcmp(TimeValue,'Since Beiginning')
                        sheetName='All';
                        endrow=481;
                    elseif strcmp(TimeValue,'Last 10 years')
                        sheetName='10Y'
                        endrow=309;
                        elseif strcmp(TimeValue,'Last 5 years')
                        sheetName='5Y'
                        endrow=309;
                       elseif strcmp(TimeValue,'Last 3 years')
                        sheetName='3Y'
                        endrow=309;
                       elseif strcmp(TimeValue,'Last 2 years')
                        sheetName='2Y'
                        endrow=109;
                        elseif strcmp(TimeValue,'Last 1 year')
                        sheetName='1Y'
                        endrow=109;
                     end
                elseif strcmp(whereValue,'England')
                    workbookFile='Data1.xlsx';
                     if strcmp(TimeValue,'Since Beiginning')
                        sheetName='All';
                        endrow=241;
                    elseif strcmp(TimeValue,'Last 10 years')
                        sheetName='10Y'
                        endrow=97;
                        elseif strcmp(TimeValue,'Last 5 years')
                        sheetName='5Y'
                        endrow=77;
                       elseif strcmp(TimeValue,'Last 3 years')
                        sheetName='3Y'
                        endrow=77;
                       elseif strcmp(TimeValue,'Last 2 years')
                        sheetName='2Y'
                        endrow=77;
                        elseif strcmp(TimeValue,'Last 1 year')
                        sheetName='1Y'
                        endrow=9;
                     end
                end
                app.Result_Tab=dataImportTvTWC(workbookFile,sheetname,endRow);
                app.Result_Mat=[];
            end
        end
    end
    
                    
        

    methods (Access = private)

        % Selection changed function: PerformanceAgainstButtonGroup
        function PerformanceAgainstButtonGroupSelectionChanged(app, event)
           % selectedButton = app.PerformanceAgainstButtonGroup.SelectedObject;
            app.AllTeamsButton.Enable='off';
            app.TheOpponentButton.Enable='off';
            app.WhereDroDown.Enable='on';
            app.TimeSpanDropDown.Enable='on'
            app.GetDataButton.Enable='on';
            app.StartButton.Enable='off';
        end

        % Callback function
        function WhereDropDownValueChanged(app, event)
            %value = app.WhereDropDown.Value;
            app.AllTeamsButton.Enable='off';
            app.TheOpponentButton.Enable='off';
            app.WhereDroDown.Enable='on';
            app.TimeSpanDropDown.Enable='on'
            app.GetDataButton.Enable='on';
            app.StartButton.Enable='off';
            if strcmp(app.TimeSpanDropDown.Value,'InWorldCup')
                app.TimeSpanDropDown.Items={'Since Beginning','Last 10 years','Last 5 years','Last 3 years','Last 2 years','Last 1 year'};
            else
                app.TimeSpanDropDown.Items={'Since Beginning','Last 10 years','Last 5 years','Last 3 years','Last 2 years','Last 1 year'};
            end
            app.TimeSpanDropDown.Value='Since BEginning';
            
        end

        % Value changed function: TimeSpanDropDown
        function TimeSpanDropDownValueChanged(app, event)
           % value = app.TimeSpanDropDown.Value;
            app.AllTeamsButton.Enable='off';
            app.TheOpponentButton.Enable='off';
            app.WhereDroDown.Enable='on';
            app.TimeSpanDropDown.Enable='on'
            app.GetDataButton.Enable='on';
            app.StartButton.Enable='off';
        end

        % Button pushed function: StartButton
        function StartButtonPushed(app, event)
            app.AllTeamsButton.Enable='off';
            app.TheOpponentButton.Enable='off';
            app.WhereDroDown.Enable='on';
            app.TimeSpanDropDown.Enable='on'
            app.GetDataButton.Enable='on';
            app.StartButton.Enable='off';
        end

        % Button pushed function: StopButton
        function StopButtonPushed(app, event)
            app.AllTeamsButton.Enable='off';
            app.TheOpponentButton.Enable='off';
            app.WhereDroDown.Enable='on';
            app.TimeSpanDropDown.Enable='on'
            app.GetDataButton.Enable='on';
            app.StartButton.Enable='off';
        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            app.AllTeamsButton.Enable='off';
            app.TheOpponentButton.Enable='off';
            app.WhereDroDown.Enable='on';
            app.TimeSpanDropDown.Enable='on'
            app.GetDataButton.Enable='on';
            app.StartButton.Enable='off';

        end

        % Button pushed function: GetDataButton
        function GetDataButtonPushed(app, event)
            selectedButton=app.PerformanceAgainstButtonGroup.SelectedObject.Text;
            WhereValue=app.WhereDropDown.Value;
            TimeValue=app.TimeSpanDropDown.Value;
            app.AllTeamsButton.Enable='off';
            app.TheOpponentButton.Enable='off';
            app.WhereDroDown.Enable='on';
            app.TimeSpanDropDown.Enable='on'
            app.GetDataButton.Enable='on';
            app.StartButton.Enable='on';
            loaddata(app,selectedButton,WhereValue,TimeValue);
            disp('Data Fetched');
        end

        % Value changed function: WhereDropDown
        function WhereDropDownValueChanged2(app, event)
            value = app.WhereDropDown.Value;
            
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create SCOREBOARDUIFigure
            app.SCOREBOARDUIFigure = uifigure;
            app.SCOREBOARDUIFigure.Color = [0.6392 0.0784 0.1804];
            app.SCOREBOARDUIFigure.Position = [100 100 640 480];
            app.SCOREBOARDUIFigure.Name = 'SCORE BOARD';

            % Create PerformanceAgainstButtonGroup
            app.PerformanceAgainstButtonGroup = uibuttongroup(app.SCOREBOARDUIFigure);
            app.PerformanceAgainstButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @PerformanceAgainstButtonGroupSelectionChanged, true);
            app.PerformanceAgainstButtonGroup.Title = 'Performance Against';
            app.PerformanceAgainstButtonGroup.Position = [46 63 123 106];

            % Create AllTeamsButton
            app.AllTeamsButton = uiradiobutton(app.PerformanceAgainstButtonGroup);
            app.AllTeamsButton.Text = 'All Teams';
            app.AllTeamsButton.Position = [11 60 74 22];
            app.AllTeamsButton.Value = true;

            % Create TheOpponentButton
            app.TheOpponentButton = uiradiobutton(app.PerformanceAgainstButtonGroup);
            app.TheOpponentButton.Text = 'The Opponent';
            app.TheOpponentButton.Position = [11 38 99 22];

            % Create WhereDropDownLabel
            app.WhereDropDownLabel = uilabel(app.SCOREBOARDUIFigure);
            app.WhereDropDownLabel.HorizontalAlignment = 'right';
            app.WhereDropDownLabel.Position = [279 144 41 22];
            app.WhereDropDownLabel.Text = 'Where';

            % Create WhereDropDown
            app.WhereDropDown = uidropdown(app.SCOREBOARDUIFigure);
            app.WhereDropDown.Items = {'All Competitions', 'In WorldCup', 'England'};
            app.WhereDropDown.Editable = 'on';
            app.WhereDropDown.ValueChangedFcn = createCallbackFcn(app, @WhereDropDownValueChanged2, true);
            app.WhereDropDown.BackgroundColor = [1 1 1];
            app.WhereDropDown.Position = [335 144 100 22];
            app.WhereDropDown.Value = 'All Competitions';

            % Create TimeSpanDropDownLabel
            app.TimeSpanDropDownLabel = uilabel(app.SCOREBOARDUIFigure);
            app.TimeSpanDropDownLabel.HorizontalAlignment = 'right';
            app.TimeSpanDropDownLabel.Position = [257 88 63 22];
            app.TimeSpanDropDownLabel.Text = 'Time Span';

            % Create TimeSpanDropDown
            app.TimeSpanDropDown = uidropdown(app.SCOREBOARDUIFigure);
            app.TimeSpanDropDown.Items = {'Since Beginning', 'Last 10 years', 'Last 5 years', 'Last 2 years ', 'Last 1 year'};
            app.TimeSpanDropDown.ValueChangedFcn = createCallbackFcn(app, @TimeSpanDropDownValueChanged, true);
            app.TimeSpanDropDown.Position = [335 88 100 22];
            app.TimeSpanDropDown.Value = 'Since Beginning';

            % Create StartButton
            app.StartButton = uibutton(app.SCOREBOARDUIFigure, 'push');
            app.StartButton.ButtonPushedFcn = createCallbackFcn(app, @StartButtonPushed, true);
            app.StartButton.Position = [461 144 73 22];
            app.StartButton.Text = 'Start';

            % Create StopButton
            app.StopButton = uibutton(app.SCOREBOARDUIFigure, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed, true);
            app.StopButton.Position = [547 144 73 22];
            app.StopButton.Text = 'Stop';

            % Create ResetButton
            app.ResetButton = uibutton(app.SCOREBOARDUIFigure, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.Position = [461 88 73 22];
            app.ResetButton.Text = 'Reset';

            % Create GetDataButton
            app.GetDataButton = uibutton(app.SCOREBOARDUIFigure, 'push');
            app.GetDataButton.ButtonPushedFcn = createCallbackFcn(app, @GetDataButtonPushed, true);
            app.GetDataButton.Position = [547 88 73 22];
            app.GetDataButton.Text = 'Get Data';
        end
    end

    methods (Access = public)

        % Construct app
        function app = app1

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.SCOREBOARDUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.SCOREBOARDUIFigure)
        end
    end
end
