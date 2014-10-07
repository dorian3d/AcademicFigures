AcademicFigures
===============

Matlab scripts to create readable, color and high contrast figures for publications.

Academic Figures provides the command `afigure` that behaves as `figure` but creates
a readable figure to embed it in a text document. Academic Figures produces figures
with these properties by default (they can be customized):

1. White background instead of gray or operating system defined.
2. Large font size for legend, axis labels, ticks and title.
3. Wider lines when plotting.
4. No blank space around the chart. Thus, the image can be saved to a file without any
margin.
5. Color and gray colormaps that keep the high contrast even when printed as grayscale.
6. Chart box and grid enabled by default.
7. The dimensions and size ratio can be fixed.
8. It nicely fits `plot` and `bar` commands.

### Usage

Its usage is very simple. Just type `afigure` before any of your `plot` or `bar` commands.
You can check `AcademicFigures_Example` to show a complete example.

You can also call `aplot` or `abar` directly without calling `afigure` first. These 
have the same input and output parameters as `plot` and `bar`.

### Customization

The configuration of the Academic Figures is given by a structure returned by `aconfig`:

```matlab
config = aconfig;
````

This defines these variables:
* `BackgroundColor` (default: [1 1 1]): figure background color.
* `FontSize` (default: 20): title, axes, labels and text font size.
* `LineWidth` (default: 2): width of plot lines.
* `DrawBox` (defaut: true): show a full box around around the axes.
* `Grid` (default: true): show grid.
* `RemoveMargins` (default: true): remove blank space around axes.
* `Width` (default: []): figure width in pixels. Ignored if empty.
* `Height` (default: []): figure height in pixels. Ignored if empty.
* `SizeRatio` (default: 4/3): width by height ratio of window. Ignored if
    empty of it both Width and Height are given.
* `Colormap` (default: 'cmr'): colormap. It can be a Nx3 matrix with 
    values in [0, 1] representing N RGB colors, or the name of a 
    predefined map (these maps keep high contrast when converted into
    grayscale): 'thermal', 'cmr', 'dusk', 'hsv2', 'gray'.
* `LineStyles` (default: '-|-.|--'): styles of plot lines.

You can change any variable and create an `afigure` with the new configuration:
```matlab
config = aconfig;
config.BackgroundColor = [1 0 0]; % red background
config.Colormap = 'dusk';
afigure(config);
```

For convenience, you can modify the variables inline:
```matlab
afigure(aconfig('BackgroundColor', [1 0 0], 'Colormap', 'dusk'));
```

### Examples

You can check `AcademicFigures_Example` to show a complete examples. 
Some short examples are given in the following.

#### Example 1
```matlab
afigure;

% some data
p1 = [95, 95:-1:0];
r1 = [0, 80 + [1:10, 10:0.1:15, 15:0.05:16.7]];
p2 = [90, 90:-1:0];
r2 = [0, 60 + [1:10, 10:0.1:15, 15:0.05:16.45]];

hold all;
plot(r1, p1);
plot(r2, p2);
xlabel('Recall (%)');
ylabel('Precision (%)');
legend('Dataset 1', 'Dataset 2', 'Location', 'SouthWest');
title('Academic Figure');
```

This produces this plot:
![aplot](http://dorian3d.github.com/other/images/aplot.png)

In comparison, this is the output of the same code using the `figure` command:
![plot](http://dorian3d.github.com/other/images/plot.png)

#### Example 2
You can also create bar plots:

```matlab
afigure;

data = [10 20 30; 5 10 15];
bar(data);
xlabel('Dataset');
ylabel('Execution time (ms)');
set(gca, 'XTickLabel', {'Method 1', 'Method 2'});
legend('Step 1', 'Step 2', 'Step 3', 'Location', 'NorthEast');
title('Academic Bar Figure');
```

This produces:
![abar](http://dorian3d.github.com/other/images/abar.png)

In comparison, this is the output of the same code using the `figure` command:
![bar](http://dorian3d.github.com/other/images/bar.png)

#### Example 3
This example shows how to customize a figure:

```matlab
afigure(aconfig('Colormap', 'dusk', 'LineWidth', 5, ...
    'LineStyles', ':|--'));
    
data = repmat(12:-1:1, 5, 1);
plot(data);
xlabel('X Axis');
ylabel('Y Axis');
legend('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', ...
  'Location', 'EastOutside');
title('Academic Figure with custom parameters');
```

This produces:
![aplot](http://dorian3d.github.com/other/images/aplotcustom.png)
