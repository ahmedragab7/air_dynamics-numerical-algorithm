function [t_list,M_list,m_dot_list,Pt_list,Tt_list,mass_list] = F_solve(t0,Toll,gama,Pti,Tti,V,Pam,A,R)
t=0.0;
Pt=700000;
Tt=300;
mass=(Pt*V)/(R*Tt);
delta_t=0.01;
M_list=[];
m_dot_list=[];
Pt_list=[];
Tt_list=[];
mass_list=[];
t_list=[];
while (abs((Pt-Pam)*100/Pt)>=Toll)
    
    if (Pam/Pt)<=0.52828
        M=1;
        
        
    else
        Pe=Pam;
        M=sqrt(2/(gama-1)*((Pt/Pe)^((gama-1)/gama)-1));
    end
    G=(1+(gama-1)*M^2/2);
    Pe=Pt/G^(gama/(gama-1));
    T=Tt/G;
    Raw=Pe/(R*T);
    c=M*sqrt(gama*R*T);
    m_dot=Raw*A*c;
    MFP=m_dot*sqrt(Tt/288)/(Pt/10^5);
    fprintf('%f\n',m_dot);
    M_list(end+1)=M;
    m_dot_list(end+1)=m_dot;
    mass_list(end+1)=mass;
    Pt_list(end+1)=Pt;
    Tt_list(end+1)=Tt;
    t_list(end+1)=t;
    delta_Pt=(-gama*R*T/V)*m_dot*delta_t;
    Pt=Pt+delta_Pt;
    Tt=(Pt*V)/(mass*R);
    Mass=(Pt*V)/(R*Tt);
    t=t+delta_t;
    
    
end
    