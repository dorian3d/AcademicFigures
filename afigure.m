% AFIGURE Create an Academic Figure.
%    AFIGURE creates a figure with the enhanced color and text 
%    configuration by default, as returned by function aconfig.
% 
%    AFIGURE(H) makes H the current figure, as figure(h).
%
%    AFIGURE(config) creates a figure with the color and text configuration
%    given by the structure config. This can be obtained from function
%    aconfig.
%
%    AFIGURE(H, config) makes H the current figure and sets the given
%    configuration.
%
%    AFIGURE(config, H) is an alias of AFIGURE(H, config).
%
%    handle = AFIGURE(...) returns the handle of the figure.
%
%    See also aconfig, aplot, abar
%
function handle = afigure(h, config)
  if nargin == 0
    h = figure;
    config = aconfig;
  elseif nargin == 1
    if ishandle(h)
      h = figure(h);
      config = aconfig;
    else
      config = h;
      h = figure;
    end
  else
    if ishandle(h)
      figure(h);
    else
      h2 = config;
      config = h;
      h = figure(h2);
    end
  end
  
  if nargout > 1
    handle = h;
  end
  
  apply_config(h, config);

  
function apply_config(h, config)
  
  % Original authors of colormaps:
  % http://www.mathworks.com/matlabcentral/fileexchange/2662
  % http://www.mathworks.com/matlabcentral/fileexchange/41583
  colors = [];
  if ischar(config.Colormap)
    while isempty(colors)
      switch config.Colormap
        case 'thermal' 
          colors = [ 0 0 0; 0.3 0 0.7; 1 0.2 0; 0.9 0.9 0 ];
        case 'cmr'
          colors = [ 0 0 0; 1 0.25 0.15; 0.9 0.5 0; 0.9 0.75 0.1; ...
                     0.85 0.85 0.5 ];
        case 'dusk'
          colors = [ 0 0 0; 0 0 0.5; 0 0.5 0.5; 0.5 0.5 0.5; 1 0.5 0.5; ...
                     1 1 0.5 ];
        case 'hsv2'
          colors = [ 0 0 0; 0.5 0 0.5; 0 0 0.9; 0 1 1; 0 1 0; 1 1 0; 1 0 0 ];
        case 'gray'
          colors = [ 0 0 0; 0.4 0.4 0.4; 0.65 0.65 0.65; 0.8 0.8 0.8 ];
        otherwise
          warning('AcademicFigures:colormap', ...
            'Unknown colormap: %s', config.Colormap);
          config.Colormap = 'cmr';
      end
    end
  else
    colors = config.Colormap;
  end
  
  set(h, 'Color', config.BackgroundColor);
  set(h, 'Colormap', colors);
  set(h, 'DefaultAxesColorOrder', colors);
  set(h, 'DefaultAxesLineStyleOrder', config.LineStyles);
  set(h, 'DefaultAxesFontSize', config.FontSize);
  set(h, 'DefaultLineLineWidth', config.LineWidth);
  if config.RemoveMargins
    set(h, 'DefaultAxesLooseInset', [0 0 0 0]);
  end
  if config.DrawBox
    set(h, 'DefaultAxesBox', 'on');
  else
    set(h, 'DefaultAxesBox', 'off');
  end
  if config.Grid
    set(h, 'DefaultAxesXGrid', 'on', 'DefaultAxesYGrid', 'on', ...
      'DefaultAxesZGrid', 'on');
  else
    set(h, 'DefaultAxesXGrid', 'off', 'DefaultAxesYGrid', 'off', ...
      'DefaultAxesZGrid', 'off');
  end
 
  p = get(h, 'Position');
  if ~isempty(config.Width) && ~isempty(config.Height)
    set(h, 'Position', [p(1:2), config.Width, config.Height]);
  elseif ~isempty(config.Width) && ~isempty(config.SizeRatio)
    set(h, 'Position', [p(1:2), config.Width, ...
      config.Width / config.SizeRatio]);
  elseif ~isempty(config.Height) && ~isempty(config.SizeRatio)
    set(h, 'Position', [p(1:2), config.Height * config.SizeRatio, ...
      config.Height]);
  elseif ~isempty(config.Width)
    set(h, 'Position', [p(1:2), config.Width, p(4)]);
  elseif ~isempty(config.Height)
    set(h, 'Position', [p(1:3), config.Height]);
  elseif ~isempty(config.SizeRatio)
    set(h, 'Position', [p(1:3), p(3) / config.SizeRatio]);
  end
