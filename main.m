
% plot events_list.
clc;clear;close all;

event_folder = "data\events.csv";
ts_folder = "data\events_image_ts.csv";

%% load data;XZ
disp("Loading data...");
ts_list = readmatrix(ts_folder);
ts_list = ts_list(:, 2);
events_list = readmatrix(event_folder);
N = length(events_list);
disp("Load data done.");

%% draw slice
figure();
event_id_begin = 1;
ts_index = 1;
for i = 1:N
	e_ts = events_list(i, 1);
	if(e_ts > ts_list(ts_index) && ts_index<=length(ts_list))
		ts_index = ts_index + 1;
		events = events_list(event_id_begin:i, :);
% 		length(events)
		event_id_begin = i;
		disp("frame id: "+int2str(ts_index));
		events_p = events(events(:,4)==1, :);
		events_n = events(events(:,4)==0, :);
		scatter3(events_p(:,2), events_p(:,1),events_p(:,3), 'MarkerEdgeAlpha', 1, 'MarkerEdgeColor', 'red', 'Marker', '.'); hold on;
		scatter3(events_n(:,2), events_n(:,1),events_n(:,3),'MarkerEdgeAlpha', 1, 'MarkerEdgeColor', 'blue', 'Marker', '.'); hold off;
		t=0:0:0;
		set(gca,'xtick',t);
		set(gca,'ytick',t);
		set(gca,'ztick',t);
		grid off;
		drawnow();
	end
end












