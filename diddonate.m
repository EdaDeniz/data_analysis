classdef diddonate < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        DidDonateUIFigure  matlab.ui.Figure
        Image              matlab.ui.control.Image
        AccordingtoinputdataHeshediddonatebloodinMarch2017Label  matlab.ui.control.Label
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create DidDonateUIFigure and hide until all components are created
            app.DidDonateUIFigure = uifigure('Visible', 'off');
            app.DidDonateUIFigure.NumberTitle = 'on';
            app.DidDonateUIFigure.Color = [0.4667 0.6745 0.1882];
            app.DidDonateUIFigure.Position = [100 100 640 480];
            app.DidDonateUIFigure.Name = 'Did Donate';

            % Create Image
            app.Image = uiimage(app.DidDonateUIFigure);
            app.Image.Position = [206 229 229 209];
            app.Image.ImageSource = 'tik-isareti-png.png';

            % Create AccordingtoinputdataHeshediddonatebloodinMarch2017Label
            app.AccordingtoinputdataHeshediddonatebloodinMarch2017Label = uilabel(app.DidDonateUIFigure);
            app.AccordingtoinputdataHeshediddonatebloodinMarch2017Label.HorizontalAlignment = 'center';
            app.AccordingtoinputdataHeshediddonatebloodinMarch2017Label.FontName = 'Gabriola';
            app.AccordingtoinputdataHeshediddonatebloodinMarch2017Label.FontSize = 30;
            app.AccordingtoinputdataHeshediddonatebloodinMarch2017Label.FontWeight = 'bold';
            app.AccordingtoinputdataHeshediddonatebloodinMarch2017Label.Position = [1 13 623 217];
            app.AccordingtoinputdataHeshediddonatebloodinMarch2017Label.Text = {'According to input data,'; ' He/she did donate blood in March 2017'};

            % Show the figure after all components are created
            app.DidDonateUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = diddonate

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.DidDonateUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.DidDonateUIFigure)
        end
    end
end