classdef didnotdonate < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        DidnotdonateUIFigure  matlab.ui.Figure
        Image                 matlab.ui.control.Image
        AccordingtoinputdataHeshedidnotdonatebloodinMarch2017Label  matlab.ui.control.Label
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create DidnotdonateUIFigure and hide until all components are created
            app.DidnotdonateUIFigure = uifigure('Visible', 'off');
            app.DidnotdonateUIFigure.Color = [1 0.4784 0.4784];
            app.DidnotdonateUIFigure.Position = [100 100 640 480];
            app.DidnotdonateUIFigure.Name = 'Did not donate!';

            % Create Image
            app.Image = uiimage(app.DidnotdonateUIFigure);
            app.Image.Position = [220 225 201 229];
            app.Image.ImageSource = 'cross-png-wrong-1.png';

            % Create AccordingtoinputdataHeshedidnotdonatebloodinMarch2017Label
            app.AccordingtoinputdataHeshedidnotdonatebloodinMarch2017Label = uilabel(app.DidnotdonateUIFigure);
            app.AccordingtoinputdataHeshedidnotdonatebloodinMarch2017Label.HorizontalAlignment = 'center';
            app.AccordingtoinputdataHeshedidnotdonatebloodinMarch2017Label.FontName = 'Gabriola';
            app.AccordingtoinputdataHeshedidnotdonatebloodinMarch2017Label.FontSize = 30;
            app.AccordingtoinputdataHeshedidnotdonatebloodinMarch2017Label.FontWeight = 'bold';
            app.AccordingtoinputdataHeshedidnotdonatebloodinMarch2017Label.Position = [52 34 537 171];
            app.AccordingtoinputdataHeshedidnotdonatebloodinMarch2017Label.Text = {'According to input data,'; ' He/she did not donate blood in March 2017'};

            % Show the figure after all components are created
            app.DidnotdonateUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = didnotdonate

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.DidnotdonateUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.DidnotdonateUIFigure)
        end
    end
end