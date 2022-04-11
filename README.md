# Freq-domain-CCM
Computes an adjacencey matrix where ij-th entry is the Freq domain CCM estimate from channle i to channle j
 Output: rho_all is the adjacency matrix of directed graphs
 Inputs: data -- is multivariate timeseries rows=time columns=channels
 L -- library length < total num of samples
 fs -- sampling rate
 freqs -- freqs values for spectrogram function
 Ws -- window size
 op -- overlap percent
 minth - minimum threshold for spectrogram

Note: requires functions 'spectrogram' and 'pspectrum' in matlab
Also requires the function 'xmap' form [2]
Cite:

[1] Sandeep Avvaru and Keshab K. Parhi. "Effective brain connectivity extraction by frequency-domain convergent cross-mapping (FDCCM) and its application in parkinson’s disease classification." Submitted to IEEE Transactions on Biomedical Engineering (TBME)), 2022.

[2] Dan Mønster, Riccardo Fusaroli, Kristian Tyl´en, Andreas Roepstorff, and Jacob F. Sherson. Causal inference from noisy time-series data—testing the convergent cross-mapping algorithm in the presence of noise and external influence. Future Generation Computer Systems, 73:52–62, 2017.
