# Freq-domain-CCM
% Computes an adjacencey matrix where ij-th entry is the Freq domain CCM estimate from channle i to channle j
% Output: rho_all is the adjacency matrix of directed graphs
% Inputs: data -- is multivariate timeseries rows=time columns=channels
% L -- library length < total num of samples
% fs -- sampling rate
% freqs -- freqs values for spectrogram function
% Ws -- window size
% op -- overlap percent
% minth - minimum threshold for spectrogram

Sandeep Avvaru and Keshab K. Parhi. "Effective brain connectivity extraction by frequency-domain convergent cross-mapping (FDCCM) and its
application in parkinson’s disease classification." Submitted to IEEE Transactions on Biomedical Engineering (TBME)), 2022.
