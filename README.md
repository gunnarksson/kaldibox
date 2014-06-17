# Kaldibox

[Kaldi][kaldi] in a box. You'll need [Vagrant][vagrant] and [VirtualBox][vbox].

## Why?

Kaldi is a fantastic project. However, it has been created and has evolved in an academic setting. While the code quality is impressive (thanks to strict guidelines) in the C++ core codebase, other areas of the project may prove difficult to work with for people new to Kaldi.

These include:
- setting up a dev environment
- using your own data (currently depends on thousands of lines of Bash/Perl scripts)
- deploying Kaldi to production
- etc.

## Get started

```bash
vagrant up # run VM
vagrant ssh # log into VM
cdkalditrunk # go to Kaldi directory
./build.sh # start build... feel free to grab a coffee and go take a nap
```

## Script files

This is a collection of scripts to build Kaldi.

- init.sh: run inside VM to bootstrap a dev environment (code, libs, CLI tools, etc.)
- build.sh: run inside VM to build Kaldi and its dependencies
- user.sh: becomes ~/.bash_profile during VM provisioning

## Kaldi glossary

FST glossary can be found at: [http://www.openfst.org/twiki/bin/view/FST/FstGlossary]().

### CMN
cepstral mean normalization.

### CMVN
cepstral mean and variance normalization.

### FE
feature extraction

### FST
finite state transducer. sort of state machine where input and output 'tapes' are different

### GMM
gaussian mixture model.

### HMM
hidden markov model.

### LDA
linear discriminant analysis. It's a feature extraction method that
provides linear transformation of n-dimensional feature vectors
(or samples) into a m-dimensional space (m < n), so that samples
belonging to the same class are close together but samples from
different classes are far apart from each other.

### MFC
mel-frequency cepstrum is a representation of the short-term power spectrum of a sound, based on a linear cosine transform of a log power spectrum on a nonlinear mel scale of frequency.

### MFCC
mel-frequency cepstral coefficients are coefficients that collectively make up an MFC. MFCC are a feature widely used in automatic speech and speaker recognition. They were introduced by Davis and Mermelstein in the 1980's, and have been state-of-the-art ever since. Prior to the introduction of MFCCs, Linear Prediction Coefficients (LPCs) and Linear Prediction Cepstral Coefficients (LPCCs) and were the main feature type for automatic speech recognition (ASR).

how to extract MFCCs from a signal:
1. Frame the signal into short frames.
2. For each frame calculate the periodogram estimate of the power spectrum.
3. Apply the mel filterbank to the power spectra, sum the energy in each filter.
4. Take the logarithm of all filterbank energies.
5. Take the DCT of the log filterbank energies.
6. Keep DCT coefficients 2-13, discard the rest.

There are a few more things commonly done, sometimes the frame energy is appended to each feature vector. Delta and Delta-Delta features are usually also appended. Liftering is also commonly applied to the final features.

### PDF
probability distribution/density function. usually GMMs

## TODO
- write a step-by-step example of using own data
- try to come up with a simple, production-friendly solution to data massaging
  - if keeping run.sh, providing a scaffold tool might be a good idea
- cover classic deployment needs (offline, online, clusters, ...) using Docker
- account for GPU-based features as they're rolled out

[kaldi]: http://kaldi.sourceforge.net
[vagrant]: http://vagrantup.com
[vbox]: http://virtualbox.org
