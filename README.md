# Freq-domain-CCM
Computes an adjacencey matrix where ij-th entry is the Freq domain CCM estimate from channle i to channle j

 Output: rho_all is the adjacency matrix of directed graphs
 
 Inputs: 
 
 data -- is multivariate timeseries rows=time columns=channels
 
 L -- library length < total num of samples

 fs -- sampling rate
 
 freqs -- freqs values for spectrogram function
 
 Ws -- window size
 
 op -- overlap percent
 
 minth - minimum threshold for spectrogram

Note: requires functions 'spectrogram' and 'pspectrum' in matlab.
Also requires the function 'xmap' form [2]

Cite:

[1] S. Avvaru and K.K. Parhi, "Effective Brain Connectivity Extraction by Frequency-Domain Convergent Cross-Mapping (FDCCM) and its Application in Parkinson’s Disease Classification," IEEE Trans. on Biomedical Engineering, Feb. 2023, doi.org/10.1109/TBME.2023.3250355

