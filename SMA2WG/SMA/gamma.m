function [ end_gamma] = mygamma(Zl,Z0,L_matrix,z_matrix,N, beta )
zin=zeroes(N+1,1);
zin(1)=Zl;

for i=2: N+1
    zin(i)=z_matrix(i)*(z_matrix(i)+1j*(zin(i-1)*tan(beta*L_matrix(i))))/(zin(i-1)+1j*(z_matrix(i)*tan(beta*l_matrix(i))));
end
    end_gamma=(Z0-zin(N+1))/(Z0+zin(N+1));
end