This script implements a hearing test using pure tones with a staircase
design, interleaving left and right ear trials. It outputs Pure Tone
Audiogram (PTA) plots.

## DISCLAIMER:
This software implements a pure tone audiometry test intended for
educational and research purposes only. This software is not suitable for
clinical applications or diagnostic purposes. The results obtained from
this test should not be used to make any medical decisions. Users should
seek professional medical advice for any hearing-related concerns.
This software is supplied "as is", without any guarantees or warranties,
express or implied, including but not limited to the implied warranties
of merchantability and fitness for a particular purpose. The author is
not responsible for any misuse of this software or for any consequences
arising from its use. By using this software, you agree to assume all
risks associated with its use.

## RELIABILITY
While efforts were made to follow BS EN ISO 8253-1:2010 standards on
audiometric test methods, please note that (as per ISO 8253), the
uncertainty of hearing threshold levels determined in accordance with any
procedures also depends on a variety of parameters, such as:
a) the performance of the audiometric equipment used;
b) the type of transducers used and their fitting by the tester;
c) the frequency of test tones;
d) the conditions of the test environment, especially the ambient noise;
e) the qualification and experience of the tester:
f) the cooperation of the test subject and the reliability of responses;
g) the use of non-optimized masking noise or lack thereof;
h) the testing time, fatigue, recent noise exposure and recent physical
   exertion of the test subject, and excessive wax buildups in the outer
   ear of the subject.

In summary, the reliability of this software depends on hardware and
environmental conditions, and how it is used. In particular, audiometers
shall be constructed in accordance with IC 60645-1 and calibrated in
accordance with the requirements of the relevant part of ISO 389.
A qualified tester is understood to be someone who has followed an
appropriate course of instruction in the theory and practice of
audiometric testing. This qualification may be specified by national
authorities or other suitable organizations. A qualified tester should be
able to make decisions on the following aspects of the audiometric test
which are not specified in detail in ISO 8253 nor controlled by this
software, namely whether:
a) the left or the right ear is tested first (usually the ear considered
   to be more sensitive is chosen);
b) masking is required;
c) responses of the test subject correspond to the test signals;
d) there is any external noise event or any behaviour response of the
   test subject that might invalidate the test;
e) to interrupt, terminate or repeat all or part of the test.

## INSTRUCTIONS
1) Clone or download this repository
2) Run hearing_test.m – the calibration will be performed if it is the first
   time, and you will be asked to select a previous calibration file or re-do
   the calibration otherwise.

## INSTRUCTIONS TO THE TEST SUBJECT
As per ISO 8253, the instructions shall be phrased in (a) language
appropriate to the listener and shall normally indicate:
a) the response task;
b) the need to respond whenever the tone is heard in either ear, no
   matter how faint it may be;
C) the need to respond as soon as the tone is heard and to stop
   responding immediately once the tone is no longer heard;
d) the general pitch sequence of the tones;
e) the ear to be tested first.
f) the necessity to avoid unnecessary movements to prevent extraneous
   noise;
g) the option for the test subject to interrupt the test in case of
   discomfort;
It can be assumed that any subject able to read and understand English
will receive all required instructions by looking at the screen while
this software is running.

## FURTHER REFERENCE
For further reference, please consult:
BS ISO 226:2023
  "Acoustics. Normal equal-loudness-level contours."
BS EN ISO 8253-1:2010
  "Acoustics. Audiometric test methods. Pure-tone air and bone conduction
  audiometry."
BS EN ISO 389-2:1997
  "Acoustics. Reference zero for the calibration of audiometric
  equipment. Reference equivalent threshold sound pressure levels for
  pure tones and insert earphones."
BS EN ISO 7029:2017+A1:2024
  "Acoustics. Statistical distribution of hearing thresholds related to
  age and gender."
  
## PLEASE CITE
TBD

## CREDIT
This software is based on [this repository](https://github.com/pd2/PureToneAudiogram)
by [Pradeep D](https://github.com/pd2) of  Uhlhaas lab, Institute of
Neuroscience & Psychology, University of Glasgow, Glasgow, UK

Current Author:- Dr. Enrico Varano
Dynamics of Brain and Language Lab (Alexis Hervais-Adelman)
Department of Basic Neurosciences, University of Geneva, Switzerland

Version History:-
 ver - DD MMM YYYY - Feature added
 1.0 - 31 May 2024 - implementation of BS EN ISO 8253-1:2010 procedure
                     and hardware calibration (E. Varano)
