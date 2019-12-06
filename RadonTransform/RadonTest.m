
submap_index = 41;
submap_radon_index = 5163;
point_index = 521;
path = '/home/yaoshw/Downloads/imurec';
submap_radon_point = importdata([path '/points/pcd_' num2str(submap_radon_index) '.txt']);
C_radon = importdata([path '/radon/node' num2str(submap_radon_index+3) '.txt']);
M_radon = RadonTransform(submap_radon_point,1,3);
submap_point = importdata([path '/submap/submapcon_index' num2str(submap_index) '.txt']);
submap_point(submap_point(:,4)<0.51,:) = [];
submap_radon = RadonTransform(submap_point(:,1:3)*0.02,1,3);

point = importdata([path '/points/pcd_' num2str(point_index) '.txt']);
p_radon = RadonTransform(point,30,3);
p_radon_f = RadonTransform(point,1,3);
initial_angle = 0.945428-1.490800;
angles = -1.0:0.01:1.0;
res = RadonMatcher(C_radon,p_radon,initial_angle,angles);
figure;
plot(angles,res);
% figure;
% M_radon = M_radon/max(max(M_radon));
% p_radon_f = p_radon_f/max(max(p_radon_f));
% imshow(M_radon);
% title('submap radon');
% figure;
% imshow(p_radon_f);
% title('scan radon');
% figure;
% imshow(submap_radon);
% title('scan radon all');