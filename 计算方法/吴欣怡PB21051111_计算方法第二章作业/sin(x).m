x = [0 1 1.8 2.1 2.5 3.6 5 7 8.1 10];
y=[0 0.841471 0.973449 0.863209 0.598472 -0.442520 -0.958924 0.656987 0.969890 -0.544021]
x1=linspace(0,10,1001);
y2 = sin(x1);
y1=interp1(x,y,x1,"spline");

plot(x,y,'o')
hold on
plot(x1,y1)
hold on
plot(x1,y2)
legend('o为自选数据点','y1=三次样条插值函数','y2=sin(x)')
xlabel('x'),ylabel('y');

% 对于1000个检测点作误差分析：L2_loss& finite_Loss
L2_loss1=0;
finite_Loss=0;
for x0=0:0.01:10
    L2_loss1=L2_loss1+(interp1(x,y,x0,"spline")-sin(x0))^2;
    if abs(interp1(x,y,x0,"spline")-sin(x0))>finite_Loss
        finite_Loss=abs(interp1(x,y,x0,"spline")-sin(x0));
    end
end
L2_loss=sqrt(L2_loss1)
L2_loss
finite_Loss


