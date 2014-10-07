% Academic Figures Example
%
% Demo to show the main functionality of Academic Figures.
% Just type afigure instead of figure and see the results.
%
% Author: Dorian Galvez-Lopez
% Date: October 2014
function AcademicFigures_Example
  
  figure;
  plot_something;
  title('Normal figure');
  
  afigure;
  plot_something;
  title('Academic Figure');
  
  figure;
  bar_something;
  title('Normal bar');
  
  afigure;
  bar_something;
  title('Academic Bar Figure');
  
  afigure(aconfig('Colormap', 'dusk', 'LineWidth', 5, ...
    'LineStyles', ':|--'));
  plot_something_else;
  title('Academic Figure with custom parameters');
  
  
function plot_something
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

function bar_something
  data = [10 20 30; 5 10 15];
  bar(data);
  xlabel('Dataset');
  ylabel('Execution time (ms)');
  set(gca, 'XTickLabel', {'Method 1', 'Method 2'});
  legend('Step 1', 'Step 2', 'Step 3', 'Location', 'NorthEast');

function plot_something_else
  data = repmat(12:-1:1, 5, 1);
  plot(data);
  xlabel('X Axis');
  ylabel('Y Axis');
  legend('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', ...
    'Location', 'EastOutside');
