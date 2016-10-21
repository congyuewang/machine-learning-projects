function lrTemplate()
    load demoSynLR.mat
    
    %%
    % your codes here
    %first figure
    x1=data1.x(:,2);
    a1=size(x1);
    x1b=data1.x(1:end-1,2);
    a1b=size(x1b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A =inv([a1(:,1),sum(x1);sum(x1),sum(power(x1,2))])*[sum(data1.y);x1.'*data1.y];
   %B is parameter without  outlier sample
   B=inv([a1b(:,1),sum(x1b);sum(x1b),sum(power(x1b,2))])*[sum(data1.y(1:end-1));x1b.'*data1.y(1:end-1)];
   w1A=A;
   w1B=B;
   
   %second figure
    x2=data2.x(:,2);
    a2=size(x2);
    x2b=data2.x(1:end-1,2);
    a2b=size(x2b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A2 =inv([a2(:,1),sum(x2);sum(x2),sum(power(x2,2))])*[sum(data2.y);x1.'*data2.y];
   %B is parameter without  outlier sample
   B2=inv([a2b(:,1),sum(x2b);sum(x2b),sum(power(x2b,2))])*[sum(data2.y(1:end-1));x2b.'*data2.y(1:end-1)];
   w2A=A2;
   w2B=B2;
   
   %third figure
    x3=data3.x(:,2);
    a3=size(x3);
    x3b=data3.x(1:end-1,2);
    a3b=size(x3b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A3 =inv([a3(:,1),sum(x3);sum(x3),sum(power(x3,2))])*[sum(data3.y);x1.'*data3.y];
   %B is parameter without  outlier sample
   B3=inv([a3b(:,1),sum(x3b);sum(x3b),sum(power(x3b,2))])*[sum(data3.y(1:end-1));x3b.'*data3.y(1:end-1)];
   w3A=A3;
   w3B=B3;
   
   %forth figure
    x4=data4.x(:,2);
    a4=size(x4);
    x4b=data4.x(1:end-1,2);
    a4b=size(x4b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A4 =inv([a4(:,1),sum(x4);sum(x4),sum(power(x4,2))])*[sum(data4.y);x1.'*data4.y];
   %B is parameter without  outlier sample
   B4=inv([a4b(:,1),sum(x4b);sum(x4b),sum(power(x4b,2))])*[sum(data4.y(1:end-1));x4b.'*data4.y(1:end-1)];
   w4A=A4;
   w4B=B4;
   
   
    %%
    %     demo of TA's plot functions
          figureLR = figure(1);
          set(figureLR,'Position',[100, 100, 1000, 800]);
        plotLRline(figureLR, 1, w1A, w1B, data1.x, data1.y);
         plotLRline(figureLR, 2, w2A, w2B, data2.x, data2.y);
         plotLRline(figureLR, 3, w3A, w3B, data3.x, data3.y);
         plotLRline(figureLR, 4, w4A, w4B, data4.x, data4.y);
    % 
   % r = heldoutResidual(w1A, data1.x, data1.y);
      h1 = leverage(data1.x);
      t1 = studentized(data1.x,data1.y,w1A,h1);
      d1 = cookDist(h1,t1,2);
      
      h2 = leverage(data2.x);
      t2 = studentized(data2.x,data2.y,w2A,h2);
      d2 = cookDist(h2,t2,2);
      
      h3 = leverage(data3.x);
      t3 = studentized(data3.x,data3.y,w3A,h3);
      d3 = cookDist(h3,t3,2);
      
      h4 = leverage(data4.x);
      t4 = studentized(data4.x,data4.y,w4A,h4);
      d4 = cookDist(h4,t4,2);
      
         figureSample = figure(2);
         set(figureSample,'Position',[100, 100, 1000, 800]);
         plotSamples(figureSample, 1, data1.x, data1.y, h1, t1, d1);
         plotSamples(figureSample, 2, data2.x, data2.y, h2, t2, d2);
         plotSamples(figureSample, 3, data3.x, data3.y, h3, t3, d3);
         plotSamples(figureSample, 4, data4.x, data4.y, h4, t4, d4);
    
    %lampda=0.1
    %first figure
    x1=data1.x(:,2);
    a1=size(x1);
    x1b=data1.x(1:end-1,2);
    a1b=size(x1b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_1 =inv([a1(:,1),sum(x1);sum(x1),sum(power(x1,2))]+[0.1,0;0,0.1])*[sum(data1.y);x1.'*data1.y];
   %B is parameter without  outlier sample
   B_lampda_1=inv([a1b(:,1),sum(x1b);sum(x1b),sum(power(x1b,2))]+[0.1,0;0,0.1])*[sum(data1.y(1:end-1));x1b.'*data1.y(1:end-1)];
   w1A_lam_1=A_lampda_1;
   w1B_lam_1=B_lampda_1;
   
    %second figure
    x2=data2.x(:,2);
    a2=size(x2);
    x2b=data2.x(1:end-1,2);
    a2b=size(x2b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_2 =inv([a2(:,1),sum(x2);sum(x2),sum(power(x2,2))]+[0.1,0;0,0.1])*[sum(data2.y);x2.'*data2.y];
   %B is parameter without  outlier sample
   B_lampda_2=inv([a2b(:,1),sum(x2b);sum(x2b),sum(power(x2b,2))]+[0.1,0;0,0.1])*[sum(data2.y(1:end-1));x2b.'*data2.y(1:end-1)];
   w2A_lam_1=A_lampda_2;
   w2B_lam_1=B_lampda_2;
   
   %third figure
    x3=data3.x(:,2);
    a3=size(x3);
    x3b=data3.x(1:end-1,2);
    a3b=size(x3b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_3 =inv([a3(:,1),sum(x3);sum(x3),sum(power(x3,2))]+[0.1,0;0,0.1])*[sum(data3.y);x3.'*data3.y];
   %B is parameter without  outlier sample
   B_lampda_3=inv([a3b(:,1),sum(x3b);sum(x3b),sum(power(x3b,2))]+[0.1,0;0,0.1])*[sum(data3.y(1:end-1));x3b.'*data3.y(1:end-1)];
   w3A_lam_1=A_lampda_3;
   w3B_lam_1=B_lampda_3;
   
   %forth figure
    x4=data4.x(:,2);
    a4=size(x4);
    x4b=data4.x(1:end-1,2);
    a4b=size(x4b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_4 =inv([a4(:,1),sum(x4);sum(x4),sum(power(x4,2))]+[0.1,0;0,0.1])*[sum(data4.y);x4.'*data4.y];
   %B is parameter without  outlier sample
   B_lampda_4=inv([a4b(:,1),sum(x4b);sum(x4b),sum(power(x4b,2))]+[0.1,0;0,0.1])*[sum(data4.y(1:end-1));x4b.'*data4.y(1:end-1)];
   w4A_lam_1=A_lampda_4;
   w4B_lam_1=B_lampda_4;
    
        figureLR = figure(3);
          set(figureLR,'Position',[100, 100, 1000, 800]);
        plotLRline(figureLR, 1, w1A_lam_1, w1B_lam_1, data1.x, data1.y);
         plotLRline(figureLR, 2, w2A_lam_1, w2B_lam_1, data2.x, data2.y);
         plotLRline(figureLR, 3, w3A_lam_1, w3B_lam_1, data3.x, data3.y);
         plotLRline(figureLR, 4,  w4A_lam_1, w4B_lam_1, data4.x, data4.y);
         
         
     %lampda=1
    %first figure
    x1=data1.x(:,2);
    a1=size(x1);
    x1b=data1.x(1:end-1,2);
    a1b=size(x1b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_1_1 =inv([a1(:,1),sum(x1);sum(x1),sum(power(x1,2))]+[1,0;0,1])*[sum(data1.y);x1.'*data1.y];
   %B is parameter without  outlier sample
   B_lampda_1_1=inv([a1b(:,1),sum(x1b);sum(x1b),sum(power(x1b,2))]+[1,0;0,1])*[sum(data1.y(1:end-1));x1b.'*data1.y(1:end-1)];
   w1A_lam_2=A_lampda_1_1;
   w1B_lam_2=B_lampda_1_1;
   
    %second figure
    x2=data2.x(:,2);
    a2=size(x2);
    x2b=data2.x(1:end-1,2);
    a2b=size(x2b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_2_1 =inv([a2(:,1),sum(x2);sum(x2),sum(power(x2,2))]+[1,0;0,1])*[sum(data2.y);x2.'*data2.y];
   %B is parameter without  outlier sample
   B_lampda_2_1=inv([a2b(:,1),sum(x2b);sum(x2b),sum(power(x2b,2))]+[1,0;0,1])*[sum(data2.y(1:end-1));x2b.'*data2.y(1:end-1)];
   w2A_lam_2=A_lampda_2_1;
   w2B_lam_2=B_lampda_2_1;
   
   %third figure
    x3=data3.x(:,2);
    a3=size(x3);
    x3b=data3.x(1:end-1,2);
    a3b=size(x3b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_3_1 =inv([a3(:,1),sum(x3);sum(x3),sum(power(x3,2))]+[1,0;0,1])*[sum(data3.y);x3.'*data3.y];
   %B is parameter without  outlier sample
   B_lampda_3_1=inv([a3b(:,1),sum(x3b);sum(x3b),sum(power(x3b,2))]+[1,0;0,1])*[sum(data3.y(1:end-1));x3b.'*data3.y(1:end-1)];
   w3A_lam_3=A_lampda_3_1;
   w3B_lam_3=B_lampda_3_1;
   
   %forth figure
    x4=data4.x(:,2);
    a4=size(x4);
    x4b=data4.x(1:end-1,2);
    a4b=size(x4b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_4_1 =inv([a4(:,1),sum(x4);sum(x4),sum(power(x4,2))]+[1,0;0,1])*[sum(data4.y);x4.'*data4.y];
   %B is parameter without  outlier sample
   B_lampda_4_1=inv([a4b(:,1),sum(x4b);sum(x4b),sum(power(x4b,2))]+[1,0;0,1])*[sum(data4.y(1:end-1));x4b.'*data4.y(1:end-1)];
   w4A_lam_4=A_lampda_4_1;
   w4B_lam_4=B_lampda_4_1;
    
        figureLR = figure(4);
          set(figureLR,'Position',[100, 100, 1000, 800]);
        plotLRline(figureLR, 1, w1A_lam_1, w1B_lam_1, data1.x, data1.y);
         plotLRline(figureLR, 2, w2A_lam_2, w2B_lam_2, data2.x, data2.y);
         plotLRline(figureLR, 3, w3A_lam_3, w3B_lam_3, data3.x, data3.y);
         plotLRline(figureLR, 4,  w4A_lam_4, w4B_lam_4, data4.x, data4.y);
         
    %lampda=10
    %first figure
    x1=data1.x(:,2);
    a1=size(x1);
    x1b=data1.x(1:end-1,2);
    a1b=size(x1b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_1_10 =inv([a1(:,1),sum(x1);sum(x1),sum(power(x1,2))]+[10,0;0,10])*[sum(data1.y);x1.'*data1.y];
   %B is parameter without  outlier sample
   B_lampda_1_10=inv([a1b(:,1),sum(x1b);sum(x1b),sum(power(x1b,2))]+[10,0;0,10])*[sum(data1.y(1:end-1));x1b.'*data1.y(1:end-1)];
   w1A_lam_10=A_lampda_1_10;
   w1B_lam_10=B_lampda_1_10;
   
    %second figure
    x2=data2.x(:,2);
    a2=size(x2);
    x2b=data2.x(1:end-1,2);
    a2b=size(x2b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_2_10 =inv([a2(:,1),sum(x2);sum(x2),sum(power(x2,2))]+[10,0;0,10])*[sum(data2.y);x2.'*data2.y];
   %B is parameter without  outlier sample
   B_lampda_2_10=inv([a2b(:,1),sum(x2b);sum(x2b),sum(power(x2b,2))]+[10,0;0,10])*[sum(data2.y(1:end-1));x2b.'*data2.y(1:end-1)];
   w2A_lam_10=A_lampda_2_10;
   w2B_lam_10=B_lampda_2_10;
   
   %third figure
    x3=data3.x(:,2);
    a3=size(x3);
    x3b=data3.x(1:end-1,2);
    a3b=size(x3b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_3_10 =inv([a3(:,1),sum(x3);sum(x3),sum(power(x3,2))]+[10,0;0,10])*[sum(data3.y);x3.'*data3.y];
   %B is parameter without  outlier sample
   B_lampda_3_10=inv([a3b(:,1),sum(x3b);sum(x3b),sum(power(x3b,2))]+[10,0;0,10])*[sum(data3.y(1:end-1));x3b.'*data3.y(1:end-1)];
   w3A_lam_10=A_lampda_3_10;
   w3B_lam_10=B_lampda_3_10;
   
   %forth figure
    x4=data4.x(:,2);
    a4=size(x4);
    x4b=data4.x(1:end-1,2);
    a4b=size(x4b);
    %disp(a1b);
    %A is the parameter with outlier sample
   A_lampda_4_10 =inv([a4(:,1),sum(x4);sum(x4),sum(power(x4,2))]+[10,0;0,10])*[sum(data4.y);x4.'*data4.y];
   %B is parameter without  outlier sample
   B_lampda_4_10=inv([a4b(:,1),sum(x4b);sum(x4b),sum(power(x4b,2))]+[10,0;0,10])*[sum(data4.y(1:end-1));x4b.'*data4.y(1:end-1)];
   w4A_lam_10=A_lampda_4_10;
   w4B_lam_10=B_lampda_4_10;
    
        figureLR = figure(5);
          set(figureLR,'Position',[100, 100, 1000, 800]);
        plotLRline(figureLR, 1, w1A_lam_10, w1B_lam_10, data1.x, data1.y);
         plotLRline(figureLR, 2, w2A_lam_10, w2B_lam_10, data2.x, data2.y);
         plotLRline(figureLR, 3, w3A_lam_10, w3B_lam_10, data3.x, data3.y);
         plotLRline(figureLR, 4,  w4A_lam_10, w4B_lam_10, data4.x, data4.y);
end

function r = heldoutResidual(w, dataValX, dataValY)
% evaluate/calculate the residual on heldout data
% your code here

r=dataValY-dataValX*w;

end

function w = lrFit(dataX,dataY)
% fit the linear regression parameters   
%w =inv([a1(:,1),sum(x1);sum(x1),sum(power(x1,2))])*[sum(data1.y);x1.'*data1.y];
% your code here
end

function h = leverage(dataX)
% calculate leverage of every sample    
% your code here
x=dataX(:,2);
H=x*inv(transpose(x)*x)*transpose(x);
h=diag(H);
end

function t = studentized(dataX,dataY,w,h)
% calculate studentized residual for every sample
% your code here
v=var(h);
r = heldoutResidual(w, dataX, dataY);
t=r./(v*sqrt(1-h));
end

function d = cookDist(h,t,k)
% calculate cook's distance for every sample
% your code here
d=(h./(1-h)).*power(t,2)/(1+k);
end

function plotLRline(figureLR, subPID, w1, w2, dataX, dataY)
% [dataX, dataY]: coordinates of data samples
% w: the linear regresison parameters

    w1 = transpose(w1(:));
    w2 = transpose(w2(:));
    dataY = dataY(:);
    if size(dataX,1)~=length(dataY)
        dataX=dataX';
    end
    if size(dataX,1)~=length(dataY)
        error('data size inconsistent');
    end
    
    bl = [min(dataX(:,2))-1, min(dataY)-1];
    ur = [max(dataX(:,2))+1, max(dataY)+1];
    figure(figureLR)
    subplot(2,2,subPID), plot(dataX(1:end-2,2), dataY(1:end-2),'o','MarkerSize',8,'LineWidth',2);
    hold on, 
    plot(dataX(end-1,2), dataY(end-1),'go','MarkerSize',8,'LineWidth',2);
    plot(dataX(end,2), dataY(end),'ro','MarkerSize',8,'LineWidth',2);
    plot([bl(1), ur(1)], [w1*[1;bl(1)], w1*[1;ur(1)]],'k-','lineWidth',3);
    plot([bl(1), ur(1)], [w2*[1;bl(1)], w2*[1;ur(1)]],'m-','lineWidth',3);
    hleg = legend('majority','leverage','outlier','LR');
    set(hleg,'Location','NorthWest','FontSize',12,'FontWeight','Demi');
    title(['(' num2str(subPID), ')'],'FontSize',12,'FontWeight','Demi')
    xlabel('x','FontSize',15,'FontWeight','Demi')
    ylabel('y','FontSize',15,'FontWeight','Demi')
end

function plotSamples(figureLR, subPID, dataX, dataY, h, t, d)
% h, t, d: 
%   leverage, studentized_residual, cook's distance of samples
    [~, idxH] = max(h);
    [~, idxT] = max(t);
    [~, idxD] = max(d);
    
    dataY = dataY(:);
    if size(dataX,1)~=length(dataY)
        dataX=dataX';
    end
    if size(dataX,1)~=length(dataY)
        error('data size inconsistent');
    end
    
    figure(figureLR)
    subplot(2,2,subPID), plot(dataX(1:end-2,2), dataY(1:end-2),'o','MarkerSize',8,'LineWidth',2);
    hold on, 
    plot(dataX(end-1,2), dataY(end-1),'go','MarkerSize',8,'LineWidth',2);
    plot(dataX(end,2), dataY(end),'ro','MarkerSize',8,'LineWidth',2);
    plot(dataX(idxH(1),2), dataY(idxH(1)), 'cd','MarkerSize',12,'LineWidth',3);
    plot(dataX(idxT(1),2), dataY(idxT(1)), 'ms','MarkerSize',12,'LineWidth',3);
    plot(dataX(idxD(1),2), dataY(idxD(1)), 'k>','MarkerSize',12,'LineWidth',3);
    hleg = legend('majority','leverage','outlier','max-H','max-T','max-Cook');
    set(hleg,'Location','NorthWest','FontSize',12,'FontWeight','Demi');
    title(['(', num2str(subPID), ')'],'FontSize',12,'FontWeight','Demi')
    xlabel('x','FontSize',15,'FontWeight','Demi')
    ylabel('y','FontSize',15,'FontWeight','Demi')
end
