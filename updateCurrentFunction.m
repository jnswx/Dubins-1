% 在海流存在/不存在的条件下实现邻域更新function weight_new = updateCurrentFunction(weight,B,Neigh,dist,winnerT,Dmin,vc,ai,flag)r=1;n = size(weight);i = n(1,2);% eta = 1;for j = 1:i    [le_x, le_y] = moveFunction(winnerT,weight(:,j));%  if(dist(j) < eta*Dmin)%     if(dist(j) <= Dmin)    if(dist(j) == Dmin)        %更新获胜机器人目标判断是否载入洋流参数        if(flag==0)%无洋流            weight_new(:,j)=winnerT;        elseif(flag==1)%有洋流            weight_new(:,j)=winnerT+[vc*cos(ai);vc*sin(ai)];        end    else        k=B*dist(j);        ai3=atan2(le_y,le_x);        vcn=vc*sin(ai3-ai);        k1=vcn/k;        ai4=ai3+asin(k1);        weight_new(:,j) = weight(:,j) +[B*Neigh(j)*dist(j)*cos(ai4); B*Neigh(j)*dist(j)*sin(ai4)]+[vc*Neigh(j)*cos(ai);vc*Neigh(j)*sin(ai)];%+[B*r*cos(ai6);B*r*sin(ai6)]%         weight_new(:,j) = winnerT;    endend