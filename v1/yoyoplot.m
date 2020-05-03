%yoyo11 = [2 2 0; 2 -2 0; -2 -2 0; -2 2 0; 2 2 4; 2 -2 4; -2 -2 4; -2 2 4];
mesh(X_best,Y_best,Z_best);colormap([.8 .8 .8]);
hold on
poly_rectangle(yoyo11(1,:),yoyo11(2,:),yoyo11(3,:),yoyo11(4,:))
poly_rectangle(yoyo11(5,:),yoyo11(6,:),yoyo11(7,:),yoyo11(8,:))
poly_rectangle(yoyo11(1,:),yoyo11(2,:),yoyo11(6,:),yoyo11(5,:))
poly_rectangle(yoyo11(2,:),yoyo11(3,:),yoyo11(7,:),yoyo11(6,:))
poly_rectangle(yoyo11(3,:),yoyo11(4,:),yoyo11(8,:),yoyo11(7,:))
poly_rectangle(yoyo11(4,:),yoyo11(1,:),yoyo11(5,:),yoyo11(8,:))

xlabel('X') 
ylabel('Y')
zlabel('Z')
