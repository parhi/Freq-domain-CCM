% Computes an adjacencey matrix where ij-th entry is the Freq domain CCM estimate from channle i to channle j
% Output: rho_all is the adjacency matrix of directed graphs
% Inputs: data -- is multivariate timeseries rows=time columns=channels
% L -- library length < total num of samples
% fs -- sampling rate
% freqs -- freqs values for spectrogram function
% Ws -- window size
% op -- overlap percent
% minth - minimum threshold for spectrogram

function [rho_all]= compute_freq_CCM(data,L,fs,freqs,WS,OP,minTh)

N_data= size(data,1);
num_ch= size(data,2); % num of channels
%% create an array of 100 library sizes from 100 to max possible
% Lmin = 500;
% Lmax = N_data-(m-1)*tau; % Max possible Library size%%%%%%%%%%%%%%%%%%
% Lmax=10000;
% [Lmin:Lstep:Lmax]';

%% Perform phase space embedding with parameters tau and m
MY_all=cell(1,num_ch);
Y_all = cell(1,num_ch);
for i = 1:num_ch
    Y_all{i}=data(:,i)';
%     [pxx,f,t]=pspectrum(data(:,i)',fs,'spectrogram','FrequencyLimits',[minF maxF],'TimeResolution',1,'OverlapPercent',OP,'MinThreshold',-30,'Reassign',false);
    [s,f,t]=spectrogram(data(:,i)',WS,round(OP/100*WS),freqs,fs,'yaxis','power','MinThreshold',minTh);
    pxx=abs(s);
    MY_all{i}= pxx';
end

%% compute CCM between every pair
pairs = nchoosek(1:num_ch,2);
rho_i2j=zeros(1,length(pairs));
rho_j2i=zeros(1,length(pairs));

tic
for i=1:size(pairs,1)
    pairs = nchoosek(1:num_ch,2);
    X=Y_all{1,pairs(i,1)};
    Y=Y_all{1,pairs(i,2)};
    MX=MY_all{1,pairs(i,1)};
    MY=MY_all{1,pairs(i,2)};
    [ X_MY, Y_MX, X1, Y1] = xmap( X, Y, MX, MY, numel(f), 1, L,'random');
    rho_X = max( [ 0, 1-(immse(X_MY,X1')/var(X1)) ] );
    rho_Y = max( [ 0, 1-(immse(Y_MX,Y1')/var(Y1)) ] );
    
    %matrix from row to col
    rho_i2j(i)= rho_X;
    rho_j2i(i)= rho_Y;
end

rho_all=zeros(num_ch,num_ch);
pairs = nchoosek(1:num_ch,2);
for i =1: size(pairs,1)
    rho_all(pairs(i,1),pairs(i,2))=rho_i2j(i);
    rho_all(pairs(i,2),pairs(i,1))=rho_j2i(i);
end
% end
toc

end
