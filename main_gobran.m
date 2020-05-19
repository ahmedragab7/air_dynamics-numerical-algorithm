t_span=[0:100];
[t_list,M_list,m_dot_list,Pt_list,T_list,mass_list]=F_solve(0,0.05,1.4,700000,300,2,100000,0.001,287)
subplot(2,1,1);
plot(t_list,m_dot_list)
subplot(2,1,2);
plot(t_list,M_list)